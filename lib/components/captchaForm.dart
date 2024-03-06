import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'captcha.dart';

class CaptchaForm extends StatefulWidget {
  @override
  _CaptchaFormState createState() => _CaptchaFormState();
}

class _CaptchaFormState extends State<CaptchaForm> {
  String captcha = generateCaptcha();
  TextEditingController captchaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            captcha,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),

         SizedBox(width: 08,),
         Expanded(
            child: TextFormField(
              controller: captchaController,
              decoration: InputDecoration(
                hintText: 'Enter CAPTCHA',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // SizedBox(height: 20.0),
          // ElevatedButton(
          //   onPressed: () {
          //     // Here you can verify the entered CAPTCHA
          //     String enteredCaptcha = captchaController.text;
          //     if (enteredCaptcha == captcha) {
          //       // CAPTCHA matched
          //       print('CAPTCHA matched!');
          //     } else {
          //       // CAPTCHA mismatched
          //       print('CAPTCHA mismatched!');
          //     }
          //   },
          //   child: Text('Submit'),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    captchaController.dispose();
    super.dispose();
  }
}