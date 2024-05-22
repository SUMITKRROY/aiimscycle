import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ColorScheme myColorScheme = const ColorScheme.light(
//   primary: Color(0xFF333333),
//   // Corresponds to text color in CSS
//   secondary: Color(0xFFF0F0F0),
//   // Corresponds to background color in CSS
//   primaryContainer: Color(0xFF3fbbc0),
//   surface: Color(0xFFF0F0F0),
//   // Corresponds to background color in CSS
//   background: Color(0xFFF0F0F0),
//   // Corresponds to background color in CSS
//   error: Colors.red,
//   // Placeholder color for error
//   onPrimary: Color(0xFFF0F0F0),
//   // Corresponds to background color in CSS
//   onSecondary: Color(0xFF333333),
//   // Corresponds to text color in CSS
//   onSurface: Color(0xFF333333),
//   // Corresponds to text color in CSS
//   onBackground: Color(0xFF333333),
//   // Corresponds to text color in CSS
//   onError: Colors.white,
//   // Text color for error messages
//   brightness: Brightness.light, // Assuming light theme
// );
// ColorScheme myDarkColorScheme = const ColorScheme.dark(
//   primary: Color(0xFFF0F0F0),
//   // Inverted from light theme
//   secondary: Color(0xFF333333),
//   // Inverted from light theme
//   primaryContainer: Color(0xFF3fbbc0),
//   surface: Color(0xFF333333),
//   // Inverted from light theme
//   background: Color(0xFF333333),
//   // Inverted from light theme
//   error: Colors.red,
//   // Placeholder color for error
//   onPrimary: Color(0xFF333333),
//   // Inverted from light theme
//   onSecondary: Color(0xFFF0F0F0),
//   // Inverted from light theme
//   onSurface: Color(0xFFF0F0F0),
//   // Inverted from light theme
//   onBackground: Color(0xFFF0F0F0),
//   // Inverted from light theme
//   onError: Colors.white,
//   // Text color for error messages
//   brightness: Brightness.dark, // Specifying dark theme
// );

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: ColorsData.tealColor, foregroundColor: Colors.white),
  ),
  textTheme: const TextTheme(
      titleLarge:
          TextStyle(fontSize: 20, color: ColorsData.whiteColor, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 16, color: ColorsData.darkGrayColor)),
  inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorsData.primaryColor),
      ),
      contentPadding: EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
);

ThemeData lightMode = ThemeData(
  // primaryColor: ColorsData.primaryPurpleColor,
  brightness: Brightness.light,
  useMaterial3: true,
  // secondaryHeaderColor: myColorScheme.primaryContainer,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: ColorsData.tealColor, foregroundColor: ColorsData.whiteColor),
  ),
  // colorScheme: myColorScheme,
  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.transparent,
    // toolbarHeight: 80.h,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    // buttonColor: myColorScheme.primaryContainer, // Button color
    textTheme: ButtonTextTheme.accent, // Button text color
  ),
  textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 16, color: ColorsData.darkGrayColor)),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsData.darkGrayColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsData.primaryColor),
    ),
    contentPadding: EdgeInsets.all(16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    hintStyle: TextStyle(color: ColorsData.darkGrayColor),
    fillColor: Colors.white,
    filled: true,
  ),
);

class ColorsData {
  // Common Colors
  static const Color primaryColor = Color(0xFF3fbbc0);
  static const Color secondaryColor = Color(0xFF65c9cd);
  static const Color textColor = Color(0xFF444444);
  static const Color whiteColor = Colors.white;
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color darkGrayColor = Color(0xFF333333);

  // New accent colors
  static const Color primaryPurpleColor = Color(0xFF6200EE);
  static const Color secondaryPurpleColor = Color(0xFF3700B3);
  static const Color tealColor = Color(0xFF03DAC5);

  // Color for preloader
  static const Color preloaderBorderColor = primaryColor;
  static const Color preloaderTopColor = Color(0xFFecf8f9);

  // Color for back-to-top button
  static const Color backToTopBackgroundColor = primaryColor;
  static const Color backToTopHoverBackgroundColor = secondaryColor;
  static const Color backToTopIconColor = whiteColor;

  // Color for top bar
  static const Color topbarBackgroundColor = primaryColor;
  static const Color topbarTextColor = whiteColor;

  // Color for header
  static const Color headerBackgroundColor = whiteColor;
  static const Color headerShadowColor = shadowColor;
  static const Color headerTextColor = darkGrayColor;
  static const Color headerAppointmentBtnBackgroundColor = primaryColor;
  static const Color headerAppointmentBtnHoverBackgroundColor = secondaryColor;
  static const Color headerLogoColor = darkGrayColor;

  // Footer Colors
  static const Color footerBackground = Color(0xFFEEEEEE);
  static const Color footerText = darkGrayColor;
  static const Color footerTopBackground = Color(0xFFF6F6F6);

  // Social Links Colors
  static const Color socialLinksBackground = primaryColor;
  static const Color socialLinksHoverBackground = secondaryColor;
  static const Color socialLinksIcon = primaryColor;

  // Footer Links Colors
  static const Color footerLinkText = darkGrayColor;
  static const Color footerLinkTextHover = primaryColor;

  // Newsletter Button Colors
  static const Color newsletterButtonBackground = primaryColor;
  static const Color newsletterButtonHoverBackground = secondaryColor;

  // Testimonials Colors
  static const Color testimonialsQuoteIcon = Color(0xFFB2E4E6);
  static const Color testimonialsBackground = Color(0xFFF0FAFA);

  // Contact Form Colors
  static const Color contactFormErrorMessageBackground = Color(0xFFED3C0D);
  static const Color contactFormSuccessMessageBackground = Color(0xFF18D26E);
  static const Color contactFormLoadingBackground = whiteColor;

  // FAQ Colors
  static const Color faqQuestionText = Color(0xFF32969A);
  static const Color faqCollapsedIcon = primaryColor;
}

class AppSizes {
  // Padding and Margin Sizes
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;

  static const double smallMargin = 8.0;
  static const double mediumMargin = 16.0;
  static const double largeMargin = 24.0;

  // Button Sizes
  static const double buttonHeight = 48.0;
  static const double buttonWidth = 150.0;

  // Icon Sizes
  static const double smallIconSize = 24.0;
  static const double mediumIconSize = 32.0;
  static const double largeIconSize = 48.0;

  // Text Sizes
  static const double smallTextSize = 12.0;
  static const double mediumTextSize = 16.0;
  static const double largeTextSize = 24.0;

  // Container Sizes
  static const double containerWidth = 200.0;
  static const double containerHeight = 150.0;

  // Other Sizes
  static const double borderRadius = 8.0;
}
