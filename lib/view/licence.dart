import 'package:flutter/material.dart';

class Licence extends StatelessWidget {
  const Licence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Licence Agreement'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            children: [
              TextSpan(text: 'By using this application, you agree to the following terms and conditions:\n\n'),
              TextSpan(
                text: '1. ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'You must use the application in compliance with all applicable laws and regulations.\n\n'),
              TextSpan(
                text: '2. ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'You must not reverse engineer, decompile, or modify the application.\n\n'),
              TextSpan(
                text: '3. ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'You must not distribute or sell the application without permission.\n\n'),
              TextSpan(
                text: '4. ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'You must respect the intellectual property rights of the developers.\n\n'),
              TextSpan(
                text: '5. ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: 'The developers reserve the right to terminate your access to the application at any time.\n\n'),
              TextSpan(
                text: 'By continuing to use the application, you agree to be bound by these terms and conditions.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
