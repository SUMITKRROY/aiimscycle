import 'dart:convert';
import 'dart:developer';


import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Utils {
  static Function employeeIdValidator() {
    return (String? value) {
      RegExp regex = RegExp(r'^[A-Z]\d{7}$');
      if (value == null || value.isEmpty) {
        return "Employee ID is required";
      } else if (!value.startsWith(RegExp(r'[A-Z]'))) {
        return "Employee ID must start with an alphabet";
      } else if (!regex.hasMatch(value)) {
        return "Put 7 digits (e.g., E0000000)";
      }
      return null;
    };
  }

  static showLoadingProgress(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SpinKitCubeGrid(
          color: Theme.of(context).secondaryHeaderColor,
          size: 50,
      ),
    );
  }

  static String convertToMD5(String data) {
    // Convert the input string to bytes
    List<int> bytes = utf8.encode(data);

    // Generate the MD5 hash
    Digest md5Result = md5.convert(bytes);

    // Convert the result to a hexadecimal string
    String md5String = md5Result.toString();
log("md5String : $md5String");
    return md5String;
  }

  static Function passwordValidator() {
    return (String? value) {
      RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (value == null || value.isEmpty) {
        return "Password is required";
      } else if (value.length < 8) {
        return "Password must be more than 7 characters";
      } else if (!regex.hasMatch(value)) {
        return "Password should contain upper, lower, digit, and special character";
      }
      return null;
    };

}
  static Function validateUserName() {
    return (String? value) {
      RegExp regex = RegExp(r'^[a-zA-Z]');

      if (value == null || value.isEmpty) {
        return "Name is required";
      } else if (value.length < 3) {
        return "Name must be more than 2 characters";
      } else if (!regex.hasMatch(value)) {
        return "Name should only contain letters";
      }

      return null;
    };
  }
 static Function phoneValidator() {
    return (String? value) {
      RegExp regex = RegExp(r'^[0-9]{10}$'); // Assuming a 10-digit phone number format

      if (value == null || value.isEmpty) {
        return "Phone number is required";
      } else if (!regex.hasMatch(value)) {
        return "Invalid phone number format";
      }

      return null;
    };
  }



  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget getSizedBoxHeight(double height) {
    return SizedBox(height: height);
  }
}
