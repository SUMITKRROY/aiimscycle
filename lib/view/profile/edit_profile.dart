import 'dart:convert';
import 'dart:io';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/custom_TextFeild.dart';
import '../../database/table/user_profile.dart';
import '../../utils/utils.dart';
import '../user/exception_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _employee = TextEditingController();
  final TextEditingController _email = TextEditingController();
  var isLoading = false;
  File? _image;
  final imagePicker = ImagePicker();
  String? userImage = '';
  var isRemarkEnabled = true;
  var selfiImgBase64 = '';
  var selfiImg = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    try {
      return Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Edit Profile",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _image == null
                                    ? GestureDetector(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0, right: 20, left: 20, bottom: 10),
                                            child: CircleAvatar(
                                                radius: width * 0.25,
                                                backgroundColor: Colors.grey,
                                                child: const Text("Tap to select image"))))
                                    : GestureDetector(
                                        onTap: () {
                                          _showPicker(context);
                                        },
                                        child: CircleAvatar(
                                            radius: width * 0.25,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: FileImage(
                                              _image!,
                                            )),
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            label: 'Name',
                            onChanged: (val) => {},
                            controller: _name,
                            keyboardType: TextInputType.text,
                            validatorLabel: 'Name',
                            validator: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            validatorFunc: Utils.phoneValidator(),
                            label: 'phone',
                            onChanged: (val) => {},
                            controller: _phone,
                            keyboardType: TextInputType.phone,
                            validatorLabel: 'phone',
                            validator: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(8),
                            ],
                            validatorFunc: Utils.employeeIdValidator(),
                            label: 'Employee code',
                            onChanged: (val) => {},
                            controller: _employee,
                            keyboardType: TextInputType.text,
                            validatorLabel: 'Employee code',
                            validator: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            label: 'Email',
                            onChanged: (val) => {},
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            validatorLabel: 'email',
                            validator: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 50,
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    bool isValid = _formKey.currentState!.validate();
                                    Map<String, dynamic> profileData = {
                                      ProfileTable.name: _name.text,
                                      ProfileTable.phone: _phone.text,
                                      ProfileTable.profileImage: _image?.path,
                                      ProfileTable.employeeId: _employee.text,
                                      ProfileTable.email: _email.text,
                                    };
                                    if (isValid) {
                                      if (_image != null) {
                                        await profileTable.insert(profileData);
                                        Navigator.pop(context);
                                      } else {
                                        Utils.snackbarToast('Please Choose a profile Picturevali');
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "Save",
                                    // style: TextStyle(
                                    //     fontSize: 14,
                                    //     fontFamily: 'inter',
                                    //     fontWeight: FontWeight.w600,
                                    //     color: Colors.white)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    } catch (e) {
      return ExceptionScreen();
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        // backgroundColor: Colors.black38,
        context: context,
        builder: (BuildContext) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(children: [
                const Text('Upload Selfie', textAlign: TextAlign.start),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                      child: const SizedBox(
                        width: 60,
                        child: Wrap(
                          children: [
                            SizedBox(width: 50, child: Icon(Icons.camera_alt_outlined)),
                            Text('Camera')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);

        final bytes = _image?.readAsBytesSync();
        selfiImgBase64 = base64Encode(bytes!);
      });
    }
  }

  _imgFromGallery() async {
    PickedFile? image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  ProfileTable profileTable = ProfileTable();

// Insert profile data
}
