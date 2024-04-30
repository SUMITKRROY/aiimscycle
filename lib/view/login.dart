import 'package:aiimscycle/view/register.dart';
import 'package:aiimscycle/view/scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/components/cutom_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';
import '../components/captcha.dart';
import '../components/captchaForm.dart';
import '../components/custom_TextFeild.dart';
import '../provider/login/login_bloc.dart';
import '../utils/utils.dart';


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
    super.initState();
    passwordVisible = true;
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
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Form(
          key: _formKey,
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                Utils.showLoadingProgress(context);
              } else if (state is LoginSuccess) {
                Navigator.of(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ScannerScreen()));
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
                  Center(child: Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),),
                  sizedBox,
                  CustomText(lable: "Enter your Employee Id"),
                  sizedBox,
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
                    ],
                  ),
                  sizedBox,
                  CaptchaForm(captchaController: captchaController,),
                  sizedBox,
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            bool isValid = _formKey.currentState!.validate();
                            if (isValid) {
                              // ignore: avoid_single_cascade_in_expression_statements
                               BlocProvider.of<LoginBloc>(context)..add(GetPhoneNo(phone: _employeeID.text, password: _password.text));
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const ScannerScreen()),);
                            }
                          },
                          child: const Text("Login"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have any account?"),
                            const SizedBox(height: 05,),
                            InkWell(
                              onTap: () {
                                // Add your login logic here
                                // For example, you can navigate to the login screen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                                );

                              },
                              child: const Text(
                                'click here',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
