import 'dart:convert';
import 'dart:io';
import 'package:aiimscycle/components/captchaForm.dart';
import 'package:aiimscycle/components/custome_image.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:aiimscycle/view/auth_screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/captcha.dart';
import '../../components/custom_TextFeild.dart';
import '../../bloc/register/register_bloc.dart';
import '../../components/cutom_text.dart';
import '../../config/theamdata.dart';
import '../../utils/helper_text.dart';
import '../../utils/utils.dart';
import '../extra_screen/exception_screen.dart';

class RegisterPage extends StatefulWidget {
  final String employeeId;
  final String phone;

  const RegisterPage({required this.employeeId, required this.phone, super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String screenName = 'Register Screen';
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the Form
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _employeeID = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cnfPassword = TextEditingController();
  TextEditingController captchaController = TextEditingController();
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
  File? _profileImage;
  File? _IdFrontImage;
  File? _IdBackImage;
  bool _isChecked = false;

  @override
  void initState() {
    String captcha = generateCaptcha();
    print('Generated CAPTCHA: $captcha');

    super.initState();
    passwordVisible = true;
    _otpFocusNodes = List.generate(6, (index) => FocusNode());
    // Pre-fill the fields with data
    _employeeID.text = widget.employeeId;
    _phoneController.text = widget.phone;
  }

  void _handleIdFrontImageSelection(File image) {
    setState(() {
      _IdFrontImage = image;
    });
  }

  void _handleIdBackImageSelection(File image) {
    setState(() {
      _IdBackImage = image;
    });
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
    try {
      return Scaffold(
        appBar: AppBar(
          title: const CustomAppBar(),
          actions: [
            IconButton(
              onPressed: () {
                MyRoutes.navigateToSettingsScreen(context);
              },
              icon: Icon(
                Icons.settings,
                color: Colors.blue,
                size: 40.sp,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: BlocListener<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterLoading) {
                    Utils.showLoadingProgress(context);
                  } else if (state is RegisterSuccess) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text('You are registered successfully'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );

                    // Delayed navigation after 5 seconds
                    Future.delayed(const Duration(seconds: 5), () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    });
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // direction: Axis.vertical,
                    children: [
                      SizedBox(height: 15.h),
                      Text(
                        "Register",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Please Sign Up to Continue",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                      SizedBox(height: 15.h),
                      CustomText(label: "Enter your full name"),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        label: 'Full Name',
                        onChanged: (val) => {},
                        controller: _name,
                        keyboardType: TextInputType.text,
                        validatorFunc: Utils.validateUserName(),
                        validator: true,
                      ),
                      SizedBox(height: 15.h),
                      CustomText(label: "Enter your employee id"),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        readOnly: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(8),
                        ],
                        validatorFunc: Utils.employeeIdValidator(),
                        label: 'Employee id',
                        onChanged: (val) => {},
                        controller: _employeeID,
                        keyboardType: TextInputType.text,
                        validator: true,
                      ),
                      SizedBox(height: 15.h),
                      CustomText(label: "Enter your contact no."),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        readOnly: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        label: 'Contact No.',
                        onChanged: (val) => {},
                        controller: _phoneController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        validatorFunc: Utils.phoneValidator(),
                        validator: true,
                      ),
                      SizedBox(height: 15.h),
                      NameWithImage(
                        label: "Employee id(Front)",
                        onImageSelected: (image) {
                          _handleIdFrontImageSelection(image);
                        },
                      ),
                      NameWithImage(
                        label: "Employee id(Back)",
                        onImageSelected: (image) {
                          _handleIdBackImageSelection(image);
                        },
                      ),
                      NameWithImage(
                        label: "Profile",
                        onImageSelected: (image) {
                          _handleProfileImageSelection(image);
                        },
                      ),
                      SizedBox(height: 15.h),
                      CustomText(label: "Enter your password"),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                        ],
                        label: 'Password',
                        onChanged: (val) => {},
                        validatorFunc: Utils.passwordValidator(),
                        controller: _password,
                        keyboardType: TextInputType.text,
                        obscured: false,
                        validator: true,
                        maxline: 1,
                      ),
                      SizedBox(height: 15.h),
                      CustomText(label: "Enter your conform password"),
                      SizedBox(height: 15.h),
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
                        suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
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
                      SizedBox(height: 15.h),
                      CaptchaForm(captchaController: captchaController),
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
                          const Text("I agree to the"),
                          const SizedBox(
                            width: 05,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                MyRoutes.navigateToTermsScreen(context);
                              },
                              child: const Text(
                                'Terms and Conditions',
                                style: TextStyle(fontSize: 16.0, color: Colors.lightBlue),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                bool isValid = _formKey.currentState!.validate();
                                if (isValid && _isChecked) {
                                  BlocProvider.of<RegisterBloc>(context).add(RegisterSuccessEvent(
                                      _name.text,
                                      _employeeID.text,
                                      _phoneController.text,
                                      _IdFrontImage.toString(),
                                      _IdBackImage.toString(),
                                      _profileImage.toString(),
                                      _password.text));
                                }
                              },
                              child: const Text("Register"),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have account? "),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginPage()),
                                    );
                                  },
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.blue,
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
        // floatingActionButton: FloatingActionButton(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   child: Icon(
        //     Icons.settings,
        //     color: ColorsData.primaryColor,
        //     size: 40.sp,
        //   ),
        //   onPressed: () {
        //     MyRoutes.navigateToSettingsScreen(context);
        //   },
        // ),
      );
    } catch (e) {
      BlocProvider.of<LoggerDbCubit>(context).setLogData(
        description: CommonText.widgetExceptionText,
        screenName: screenName,
      );
      return ExceptionScreen();
    }
  }

  List<String> productAngelList = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

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
