import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/theamdata.dart';
import 'captcha.dart';
import 'custom_TextFeild.dart';
import 'cutom_text.dart';

class CaptchaForm extends StatefulWidget {
  TextEditingController captchaController;

  CaptchaForm({super.key, required this.captchaController});

  @override
  _CaptchaFormState createState() => _CaptchaFormState();
}

class _CaptchaFormState extends State<CaptchaForm> {
  String captcha = generateCaptcha();

  void refreshCaptcha() {
    setState(() {
      captcha = generateCaptcha();
      widget.captchaController.clear(); // Clear the text field
    });
  }

  final TextEditingController captchaText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(lable: "Enter the Captcha"),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    CustomTextField(
                      labelFontSize: 16.sp,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                      ],
                      label: 'Enter Captcha',
                      onChanged: (val) => {},
                      controller: widget.captchaController,
                      validatorFunc: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter captcha';
                        }
                        if (captcha != widget.captchaController.text) {
                          return ("captcha must be same");
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      obscured: false,
                      validator: true,
                      maxline: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: refreshCaptcha, // Call refreshCaptcha function on tap
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsData.tealColor, width: 2.sp),
                    ),
                    child: Center(
                      child: Text(
                        captcha,
                        style: TextStyle(fontSize: 29.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
