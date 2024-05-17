import 'package:aiimscycle/view/user/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view/about_info/about.dart';
import '../view/about_info/notification_screen.dart';
import '../view/about_info/open_source_libraries.dart';
import '../view/about_info/privacy_policy.dart';
import '../view/about_info/terms_of_use.dart';
import '../view/login.dart';
import '../view/profile/edit_profile.dart';
import '../view/profile/profile.dart';
import '../view/user/setting.dart';
import '../view/user/version_screen.dart';
import 'pageroute.dart';
import '../view/user/splash_screen.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// Splash Screen
      case RoutePath.splashScreenPage:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      ///Login screen
      case RoutePath.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      // case '/profile':
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => ProfileScreen(
      //         // argument1: args['argument1'],
      //         // argument2: args['argument2'],
      //         // argument3: args['argument3'],
      //         ),
      //   );

      /// Settings Screen
      case RoutePath.settingScreen:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );

      /// Profile Screen
      case RoutePath.profile:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );

      /// Edit Profile Screen
      case RoutePath.editProfile:
        return MaterialPageRoute(
          builder: (_) => ProfileEditScreen(),
        );

      /// Notification Screen
      case RoutePath.notification:
        return MaterialPageRoute(
          builder: (_) => NotificationScreen(),
        );

      /// AboutUs Screen
      case RoutePath.aboutUs:
        return MaterialPageRoute(
          builder: (_) => AboutUsScreen(),
        );

      /// Terms Screen
      case RoutePath.termsAndConditions:
        return MaterialPageRoute(
          builder: (_) => TermsConditionScreen(),
        );

      /// Version Screen
      case RoutePath.versionScreen:
        return MaterialPageRoute(
          builder: (_) => VersionScreen(),
        );

      /// Legal Screen
      case RoutePath.legalScreen:
        return MaterialPageRoute(
          builder: (_) => LegalScreen(),
        );

      /// PrivacyPolicy Screen

      case RoutePath.privacyPolicyScreen:
        return MaterialPageRoute(
          builder: (_) => PrivacyPolicy(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
  }

  static void navigateToSettingsScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.settingScreen);
  }

  static void navigateToNotificationScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.notification);
  }

  static void navigateToLegalScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.legalScreen);
  }

  static void navigateToVersionScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.versionScreen);
  }

  static void navigateToAboutScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.aboutUs);
  }

  static void navigateToTermsScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.termsAndConditions);
  }

  static void navigateToPolicyScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.privacyPolicyScreen);
  }

  static void navigateToProfileScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.profile);
  }

  static void navigateToProfileEditScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutePath.editProfile);
  }
//
// static void navigateToOtpScreen(BuildContext context, String mobileNumber) {
//   Navigator.pushNamed(context, '/otp_screen', arguments: mobileNumber);
// }
//
// static void navigateToProfile({required BuildContext context, String? argument1, int? argument2, bool? argument3}) {
//   Navigator.pushNamed(context, '/profile', arguments: {
//     'argument1': argument1,
//     'argument2': argument2,
//     'argument3': argument3,
//   });
// }
}
