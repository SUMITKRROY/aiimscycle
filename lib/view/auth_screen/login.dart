import 'package:aiimscycle/bloc/login_cubit/login_cubit.dart';
import 'package:aiimscycle/bloc/login_db_cubit/login_db_cubit.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:aiimscycle/database/table/cycle_table.dart';
import 'package:aiimscycle/route/route_generater.dart';
import 'package:aiimscycle/view/Admin/admin_home_page.dart';
import 'package:aiimscycle/view/auth_screen/register.dart';
import 'package:aiimscycle/view/auth_screen/verify_auth.dart';
import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:aiimscycle/view/user/cycle_detail_screen.dart';
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
import '../../components/captcha.dart';
import '../../components/captchaForm.dart';
import '../../components/custom_TextFeild.dart';
import '../../database/table/app_table.dart';
import '../../utils/utils.dart';
import '../extra_screen/exception_screen.dart';

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
                color: Colors.blue,
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
                      sessionId: state.jSessionId,
                      userRole:
                          state.loginModal.authenticate?.authorities?.first.authority.toString() ??
                              '');
                  AppTable().updateClientId("1", _employeeID.text.trim());
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
                    SizedBox(height: 20.h),
                    Text(
                      "Login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Please Sign In to Continue",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    SizedBox(height: 15.h),
                    CustomText(label: "Enter your Employee Id"),
                    SizedBox(height: 15.h),
                    CustomTextField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      label: 'Employee Id',
                      onChanged: (val) => {},
                      controller: _employeeID,
                      keyboardType: TextInputType.text,
                      validatorLabel: 'employee id',
                     // validatorFunc: Utils.employeeIdValidator(),
                      validator: true,
                    ),
                    Utils.getSizedBoxHeight(16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(label: "Enter your Password"),
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              bool isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                BlocProvider.of<LoginCubit>(context).getLogin(
                                    userId: _employeeID.text.trim(),
                                    password: _password.text.trim(),
                                    isNotConvert: false);
                              } else {
                                Utils.snackbarToast("Please fill all the details");
                              }
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                letterSpacing: 1.w,
                                // color: ColorsData.primaryPurpleColor,
                              ),
                            ),
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
                                    MaterialPageRoute(builder: (context) => const VerifyPhoneNo()),
                                  );
                                },
                                child: Text(
                                  'Click Here',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                          //     );
                          //   },
                          //   child: Text(
                          //     'Did you forgot  your password ?',
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //       color: Colors.blue,
                          //       fontSize: 16.sp,
                          //     ),
                          //   ),
                          // ),
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
