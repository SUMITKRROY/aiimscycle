import 'dart:convert';
import 'dart:io';

import 'package:aiimscycle/components/captchaForm.dart';
import 'package:aiimscycle/components/custome_image.dart';
import 'package:aiimscycle/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/components/cutom_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../components/button.dart';
import '../components/captcha.dart';
import '../components/custom_TextFeild.dart';
import '../config/theamdata.dart';
import '../provider/register/register_bloc.dart';
import '../utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the Form
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _employeeID = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cnfPassword = TextEditingController();
  bool passwordVisible = false;
  bool onTap = false;
  late List<FocusNode> _otpFocusNodes;
  int selectedOptionIndex = -1;
  List<File> _imageList = [];
  List<String> _imageListBase64 = [];
  final List<Map<String, String>> dynamicImage = [];
  final List<Map<String, dynamic>> updateDynamicImage = [];
  final ImagePicker _imagePicker = ImagePicker();
  var isLoading = false;
  int selectedIndex = 0;
  int? imageLenth;
  File? _image;
  String _selectedItem = 'Option 1';
  File? _profileImage;
  bool _isChecked = false;
  @override
  void initState() {
    String captcha = generateCaptcha();
    print('Generated CAPTCHA: $captcha');
    super.initState();
    passwordVisible = true;
    _otpFocusNodes = List.generate(6, (index) => FocusNode());
  }

  void _handleProfileImageSelection(File image) {
    setState(() {
      _profileImage = image;
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    //  _passwordController.dispose();
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget sizedBox = Utils.getSizedBoxHeight(8.0);
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                     Utils.showLoadingProgress(context);
                } else if (state is RegisterSuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                } else if (state is RegisterError) {
                 var msg = state.error;
                 Navigator.of(context).pop();
                  Fluttertoast.showToast(
                      msg: msg,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Flex(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    // Center(child: CustomText(lable: "User Register.")),
                    // CustomText(lable: "Enter your name"),
                    sizedBox,
                    CustomTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      label: 'Full Name',
                      onChanged: (val) => {},
                      controller: _name,
                      keyboardType: TextInputType.text,
                      validatorLabel: 'Full name',
                      validatorFunc: Utils.validateUserName(),
                      validator: true,
                    ),
                    sizedBox,
                    CustomTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                      ],
                      validatorFunc: Utils.employeeIdValidator(),
                      label: 'Employee id',
                      onChanged: (val) => {},
                      controller: _employeeID,
                      keyboardType: TextInputType.text,
                      validatorLabel: 'Employee ID',
                      validator: true,
                    ),
                    sizedBox,
                    CustomTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      label: 'Contact No.',
                      onChanged: (val) => {},
                      controller: _phoneController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      validatorLabel: 'Contact No.',
                      validatorFunc: Utils.phoneValidator(),
                      validator: true,
                    ),
                    sizedBox,
                    // NameWithImage(label: "Employee id(Front)"),
                    // NameWithImage(label: "Employee id(Back)"),
                    NameWithImage(
                      label: "Profile",
                      onImageSelected: (image) {
                        _handleProfileImageSelection(image);
                      },
                    ),
                    CustomTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                      ],
                      label: 'Password',
                      onChanged: (val) => {},
                      validatorFunc: Utils.passwordValidator(),
                      controller: _password,
                      keyboardType: TextInputType.text,
                      validatorLabel: 'password',
                      obscured: false,
                      validator: true,
                      maxline: 1,
                    ),
                    sizedBox,
                    CustomTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                      ],
                      label: 'Conform Password',
                      onChanged: (val) => {},
                      controller: _cnfPassword,
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter conform password';
                        }
                        if (value != _password.text) {
                          return ("Password must be same");
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      validatorLabel: 'password',
                      suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      obscured: passwordVisible,
                      validator: true,
                      maxline: 1,
                    ),
                    CaptchaForm(),
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        Text("I agree to the"),
                        SizedBox(
                          width: 05,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'terms and conditions',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.lightBlue),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              bool isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                BlocProvider.of<RegisterBloc>(context)
                                  ..add(RegisterSuccessEvent(
                                      _name.text,
                                      _employeeID.text,
                                      _phoneController.text,
                                      "front image",
                                      "idBack",
                                      _profileImage.toString(),
                                      _password.text));
                              }
                            },
                            child: const Text("Register"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("already have account? "),
                              InkWell(
                                onTap: () {
                                  // Add your Register logic here
                                  // For example, you can navigate to the Register screen
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()),
                                  );
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  List<String> productAngelList = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4'
  ];

  void _removeImage(int index) {
    setState(() {
      _imageList.removeAt(index);
    });
  }

  void _convertImagesToBase64() {
    for (File image in _imageList) {
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      _imageListBase64.add(base64Image);
    }

    print("_imageListBase64: $_imageListBase64");
  }
}
