import 'package:aiimscycle/view/auth_screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/contact_verify_cubit/phone_verify/verify_phone_no_bloc.dart';

import '../../components/appbar.dart';
import '../../components/custom_TextFeild.dart';
import '../../components/cutom_text.dart';
import '../../route/pageroute.dart';
import '../../route/route_generater.dart';
import '../../utils/utils.dart';
import 'login.dart';

class VerifyPhoneNo extends StatefulWidget {
  const VerifyPhoneNo({super.key});

  @override
  State<VerifyPhoneNo> createState() => _VerifyPhoneNoState();
}

class _VerifyPhoneNoState extends State<VerifyPhoneNo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _employeeIDController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool showOtpField = false;

  @override
  void dispose() {
    _employeeIDController.dispose();
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _getOtp() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<VerifyPhoneNoBloc>(context).add(
        VerifyPhoneNumberEvent(
          phoneNumber: _phoneController.text.toString(),
          userId: _employeeIDController.text.toString(),
        ),
      );
    }
  }

  void _verifyOtp() {
    if (_formKey.currentState!.validate()) {
      // Dispatching OTP verification event to the Bloc
      BlocProvider.of<VerifyPhoneNoBloc>(context).add(
        VerifyOtpEvent(
          phoneNumber: _phoneController.text.toString(),
          userId: _employeeIDController.text.toString(),
          otp: _otpController.text.toString(),
        ),
      );
    } else {
      Utils.snackbarToast('Please enter the OTP');
    }
  }


  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomText(label: "Enter your Employee Id"),
                SizedBox(height: 15.h),
                CustomTextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                  ],
                  label: 'Employee ID',
                  controller: _employeeIDController,
                  keyboardType: TextInputType.text,
                  validatorFunc: Utils.employeeIdValidator(),
                  validator: true, onChanged: (String ) {  },
                ),
                SizedBox(height: 15.h),
                CustomText(label: "Enter your Phone Number"),
                SizedBox(height: 15.h),
                // Phone Field using CustomTextField
                CustomTextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  label: 'Phone Number',
                  controller: _phoneController,
                  keyboardType: const TextInputType.numberWithOptions(),
                  validatorFunc: Utils.phoneValidator(),
                  validator: true, onChanged: (String ) {  },
                ),
                SizedBox(height: 15.h),
                BlocListener<VerifyPhoneNoBloc, VerifyPhoneNoState>(
                  listener: (context, state) {
                    if (state is VerifyPhoneNoLoading) {
                      Utils.showLoadingProgress(context);
                    } else if (state is VerifyPhoneNoSuccess) {
                      Navigator.of(context).pop();
                      Utils.snackbarToast('OTP sent to your phone number!');
                      setState(() {
                        showOtpField = true;
                      });
                    } else if (state is VerifyPhoneNoError) {
                      Navigator.of(context).pop();
                      Utils.snackbarToast(state.error);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: _getOtp,
                    child: const Text('Get OTP'),
                  ),
                ),

                if (showOtpField) ...[
                  SizedBox(height: 15.h),
                  CustomTextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    label: 'Enter OTP',
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    validatorFunc: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter OTP';
                      }
                      return null;
                    },
                    validator: true,
                    onChanged: (String) {},
                  ),
                  SizedBox(height: 15.h),
                  BlocListener<VerifyPhoneNoBloc, VerifyPhoneNoState>(
                    listener: (context, state) {
                      if (state is VerifyOtpSuccess) {
                        Navigator.pop(context);
                        Utils.snackbarToast("OTP Verified Successfully!");
                        Navigator.pushReplacementNamed(
                          context,
                          RoutePath.registerPage,
                          arguments: RegisterPage(
                            employeeId: _employeeIDController.text,
                            phone: _phoneController.text,
                          ),
                        );
                      } else if (state is VerifyOtpError) {
                        Utils.snackbarToast(state.error);
                      }
                    },
                    child: ElevatedButton(
                      onPressed: _verifyOtp,
                      child: const Text('Verify OTP'),
                    ),
                  ),

                ],
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
          ),
        ),
      ),
    );
  }
}
