// import 'package:aiimscycle/bloc/theme_cubit/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../route/route_generater.dart';
// import '../utils/helper_text.dart';
// import 'appbar.dart';
// import 'logo_image.dart';
//
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double height;
//   final bool? showSettingButton;
//
//   // const CustomAppBar({super.key, this.showSettingButton = false});
//   MyAppBar({
//     super.key,
//     this.height = kToolbarHeight,
//     this.showSettingButton = false,
//   });
//
//   @override
//   Size get preferredSize => Size.fromHeight(height);
//
//   // final LocalUserModal? localUserModal = MyStorage.getUserData();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeModeOption>(
//       builder: (context, themeMode) {
//         return AppBar(
//           systemOverlayStyle: SystemUiOverlayStyle(
//               statusBarColor:
//                   _getThemeMode(themeModeOption: themeMode, context: context) == ThemeMode.dark
//                       ? Theme.of(context).scaffoldBackgroundColor
//                       : Theme.of(context).scaffoldBackgroundColor
//               // statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//               // statusBarBrightness: Brightness.light, // For iOS (dark icons)
//               ),
//           actions: [
//             showSettingButton!
//                 ? IconButton(
//                     onPressed: () {
//                       MyRoutes.navigateToSettingsScreen(context);
//                     },
//                     icon: Icon(
//                       Icons.settings,
//                       // color: ColorsData.,
//                       size: 40.sp,
//                     ),
//                   )
//                 : SizedBox.shrink(),
//           ],
//           // leading: LogoImageWidget(),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               LogoImageWidget(),
//               SizedBox(width: 10.w),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     CommonText.cycle,
//                     style: TextStyle(fontSize: 20.sp),
//                   ),
//                   Text(
//                     "All India Institute Of Medical Sciences\nNew Delhi",
//                     style: TextStyle(fontSize: 12.sp),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           // toolbarHeight: 100.h,
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//         );
//       },
//     );
//   }
//
//   ThemeMode _getThemeMode(
//       {required ThemeModeOption themeModeOption, required BuildContext context}) {
//     if (themeModeOption == ThemeModeOption.System) {
//       return MediaQuery.of(context).platformBrightness == Brightness.dark
//           ? ThemeMode.dark
//           : ThemeMode.light;
//     } else if (themeModeOption == ThemeModeOption.Light) {
//       return ThemeMode.light;
//     } else {
//       return ThemeMode.dark;
//     }
//   }
// }
