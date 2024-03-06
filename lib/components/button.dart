import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
        required this.onPressed,
        required this.title,
        this.iconType = Icons.arrow_forward_ios});

  final Future<void> Function() onPressed;
  final String title;
  final IconData iconType;

  @override
  State<CustomButton> createState() {
    return _CustomButton();
  }
}

class _CustomButton extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all( EdgeInsets.all(14.r)),
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primary)),
        onPressed: _isLoading
            ? null
            : () async {
          setState(() {
            _isLoading = true;
          });
          await widget.onPressed();
          setState(() {
            _isLoading = false;
          });
        },
        child: _isLoading
            ? SizedBox(
          height: 24.h,
          width: 24.w,
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              widget.iconType,
              size: 16,
              color: Colors.white,
            ),
          ],
        ));
  }
}
