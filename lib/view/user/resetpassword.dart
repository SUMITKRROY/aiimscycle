import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/view/extra_screen/exception_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/captchaForm.dart';
import '../../components/custom_TextFeild.dart';
import '../../route/route_generater.dart';
import '../../utils/utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController conformPassword = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;

  void _submit() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      // BlocProvider.of<RegisterBloc>(context)
      //   ..add(RegisterSuccessEvent(
      //       _name.text,
      //       _employeeID.text,
      //       _phoneController.text,
      //       _IdFrontImage.toString(),
      //       _IdBackImage.toString(),
      //       _profileImage.toString(),
      //       _password.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 95.h,
          titleSpacing: 0,
          title: CustomAppBar(),
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30.h),
                  CustomTextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    label: 'old Password',
                    onChanged: (val) => {},
                    validatorFunc: Utils.passwordValidator(),
                    controller: oldPassword,
                    keyboardType: TextInputType.text,
                    obscured: false,
                    validator: true,
                    maxline: 1,
                  ),
                  SizedBox(
                    height: 08,
                  ),
                  CustomTextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    label: 'New Password',
                    onChanged: (val) => {},
                    validatorFunc: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter conform password';
                      }
                      if (value == oldPassword.text) {
                        return ("New password should be different from the old password");
                      }
                      return null;
                    },
                    controller: newPassword,
                    keyboardType: TextInputType.text,
                    obscured: false,
                    validator: true,
                    maxline: 1,
                  ),
                  SizedBox(
                    height: 08,
                  ),
                  CustomTextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    label: 'Conform Password',
                    onChanged: (val) => {},
                    controller: conformPassword,
                    validatorFunc: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter conform password';
                      }
                      if (value != newPassword.text) {
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
                  SizedBox(
                    height: 08,
                  ),
                  CaptchaForm(
                    captchaController: captchaController,
                  ),
                  SizedBox(
                    height: 08,
                  ),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                      'Submit',
                      // style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      return ExceptionScreen();
    }
  }

  @override
  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    conformPassword.dispose();
    captchaController.dispose();
    super.dispose();
  }
}
