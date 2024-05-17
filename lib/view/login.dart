import 'package:aiimscycle/bloc/login_cubit/login_cubit.dart';
import 'package:aiimscycle/bloc/login_db_cubit/login_db_cubit.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:aiimscycle/view/Admin/admin_home_page.dart';
import 'package:aiimscycle/view/register.dart';
import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:aiimscycle/view/user/resetpassword.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/components/cutom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';
import '../bloc/login/login_bloc.dart';
import '../components/captcha.dart';
import '../components/captchaForm.dart';
import '../components/custom_TextFeild.dart';
import '../utils/utils.dart';
import 'user/exception_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Add a GlobalKey for the Form

  final TextEditingController _employeeID = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  bool passwordVisible = false;
  bool onTap = false;

  @override
  void initState() {
    String captcha = generateCaptcha();
    log('Generated CAPTCHA: $captcha');
    passwordVisible = true;

    super.initState();
  }

  @override
  void dispose() {
    _employeeID.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget sizedBox = Utils.getSizedBoxHeight(8.0);
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
                // color: ColorsData.,
                size: 40.sp,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  Utils.showLoadingProgress(context);
                } else if (state is LoginLoaded) {
                  BlocProvider.of<LoginDbCubit>(context).setAppData(
                      userId: _employeeID.text.trim(),
                      password: Utils.convertToMD5(_password.text.trim()),
                      sessionId: state.loginModal.authenticate?.details.toString() ?? '',
                      userRole:
                          state.loginModal.authenticate?.authorities?.first.authority.toString() ??
                              '');

                  Navigator.of(context);

                  print(
                      '----------${state.loginModal.authenticate?.authorities?.first.authority.toString()}');

                  if (state.loginModal.authenticate?.authorities?.first.authority.toString() ==
                          'ROLE_SuperAdmin' ||
                      state.loginModal.authenticate?.authorities?.first.authority.toString() ==
                          'ROLE_Admin') {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => AdminHomePage()), (route) => false);

                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (context) => const AdminHomePage()));
                  } else if (state.loginModal.authenticate?.authorities?.first.authority
                          .toString() ==
                      'ROLE_User') {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);

                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  } else {
                    Navigator.pop(context);
                    Utils.snackbarToast('Please Define Your Role');
                  }
                } else if (state is LoginError) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h),
                    const Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomText(lable: "Enter your Employee Id"),
                    SizedBox(height: 15.h),
                    CustomTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8),
                      ],
                      label: 'Employee Id',
                      onChanged: (val) => {},
                      controller: _employeeID,
                      keyboardType: TextInputType.text,
                      validatorLabel: 'employee id',
                      validatorFunc: Utils.employeeIdValidator(),
                      validator: true,
                    ),
                    Utils.getSizedBoxHeight(16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(lable: "Enter your password"),
                        sizedBox,
                        CustomTextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16),
                          ],
                          label: 'Password',
                          onChanged: (val) => {},
                          controller: _password,
                          keyboardType: TextInputType.text,
                          validatorLabel: 'password',
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
                      ],
                    ),
                    SizedBox(height: 15.h),
                    CaptchaForm(captchaController: captchaController),
                    SizedBox(height: 15.h),
                    Center(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              bool isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                BlocProvider.of<LoginCubit>(context)
                                    .getLogin(_employeeID.text.trim(), _password.text.trim());
                              }
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) => const HomeScreen()));
                            },
                            child: const Text("Login"),
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have any account?"),
                              SizedBox(width: 15.h),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                                  );
                                },
                                child: Text(
                                  'click here',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                              );
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      return ExceptionScreen();
    }
  }
}
