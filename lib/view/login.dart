import 'package:aiimscycle/view/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aiimscycle/components/appbar.dart';
import 'package:aiimscycle/components/cutom_text.dart';

import '../components/captcha.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = false;
  bool onTap = false;
  late List<FocusNode> _otpFocusNodes;
  @override
  void initState() {
    String captcha = generateCaptcha();
    print('Generated CAPTCHA: $captcha');
    super.initState();
    passwordVisible = true;
    _otpFocusNodes = List.generate(6, (index) => FocusNode());
  }

  @override
  void dispose() {
    _employeeID.dispose();
    _passwordController.dispose();
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
      body: Form(
        key: _formKey,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
            //  Utils.showLoadingProgress(context);
            } else if (state is LoginSuccess) {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const Grievancescreen()));
            } else if (state is LoginError) {
              // Show error message
            }
          },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(lable: "Enter your mobile no."),
                  sizedBox,
                  CustomTextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    label: 'EOOOOOOO',
                    onChanged: (val) => {},
                    controller: _employeeID,
                    keyboardType: TextInputType.text,
                    validatorLabel: 'Employee ID',
                    validator: true,
                  ),
                  Utils.getSizedBoxHeight(16.0),
                  onTap == false
                      ? Column(
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
                        controller: _passwordController,
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
                  )
                      : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                              (index) => Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextFormField(
                                focusNode: _otpFocusNodes[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index <
                                        _otpFocusNodes.length - 1) {
                                      FocusScope.of(context).requestFocus(
                                          _otpFocusNodes[index + 1]);
                                    } else {
                                      // Focus on last OTP field
                                      FocusScope.of(context).unfocus();
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      sizedBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Timer: 30"),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "Resend OTP",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  sizedBox,
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            bool isValid = _formKey.currentState!.validate();
                            if (isValid) {
                              BlocProvider.of<LoginBloc>(context)
                                ..add(
                                    GetPhoneNo(phone: _employeeID.text));
                            }
                          },
                          child: const Text("Login"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have any account?"),
                            SizedBox(height: 05,),
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
            )
        ),
      ),
    );
  }
}
