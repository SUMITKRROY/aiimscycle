import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'captcha.dart';
import 'custom_TextFeild.dart';

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: refreshCaptcha, // Call refreshCaptcha function on tap
            child: Container(
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  captcha,
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
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
          ),


        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.captchaController.dispose();
    super.dispose();
  }
}
