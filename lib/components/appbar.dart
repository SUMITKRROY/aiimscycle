import 'package:aiimscycle/components/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:aiimscycle/utils/helper_text.dart';
import 'package:aiimscycle/utils/image.dart';
import 'package:aiimscycle/config/theamdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: LogoImageWidget(),
      title: Text(
        CommonText.cycle,
        style: TextStyle(fontSize: 20.sp),
      ),
      subtitle: Text(
        "All India Institute Of Medical Sciences\nNew Delhi",
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
