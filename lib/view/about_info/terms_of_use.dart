import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/helper_text.dart';
import '../extra_screen/exception_screen.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key});

  final String screenName = 'Terms and condition Screen';

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const CustomAppBar(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black), // Define the default text style
                  children: <TextSpan>[
                    TextSpan(text: 'Terms and Conditions\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),

                    TextSpan(text: 'Introduction\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'Welcome to AIIMS Cycle, a mobile application provided by AIIMS ("we", "our", "us"). By downloading, accessing, or using the AIIMS Cycle app, you agree to comply with and be bound by these Terms and Conditions ("Terms"). If you do not agree to these Terms, please do not use the AIIMS Cycle app.\n\n'),

                    TextSpan(text: '1. Use of the App\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: '1.1 *Eligibility*: You must be AIIMS employee to use this app. By using the app, you represent and warrant that you are AIIMS employee.\n\n'),
                    TextSpan(text: '1.2 *License*: We grant you a non-exclusive, non-transferable, revocable license to use the AIIMS Cycle app for your personal, non-commercial use, subject to these Terms.\n\n'),
                    TextSpan(text: '1.3 *Prohibited Uses*: You agree not to use the app for any unlawful purpose or in a way that infringes the rights of, restricts, or inhibits anyone else\'s use and enjoyment of the app.\n\n'),

                    TextSpan(text: '2. User Account\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: '2.1 *Account Creation*: To use certain features of the app, you may be required to create an account. You agree to provide accurate and complete information when creating your account and to keep this information up to date.\n\n'),
                    TextSpan(text: '2.2 *Account Security*: You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account.\n\n'),

                    TextSpan(text: '3. Privacy\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'Your privacy is important to us. Please review our Privacy Policy, which explains how we collect, use, and disclose information that pertains to your privacy. By using the app, you consent to the collection and use of your information as outlined in the Privacy Policy.\n\n'),

                    TextSpan(text: '4. Intellectual Property\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: '4.1 *Ownership*: All content, features, and functionality of the app, including but not limited to text, graphics, logos, icons, images, and software, are the exclusive property of AIIMS and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.\n\n'),
                    TextSpan(text: '4.2 *Restrictions*: You may not modify, reproduce, distribute, create derivative works of, publicly display, publicly perform, republish, download, store, or transmit any of the material on our app, except as automatically and incidentally occurs in the course of using the app for its intended purpose.\n\n'),

                    TextSpan(text: '5. Limitation of Liability\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'To the fullest extent permitted by law, AIIMS shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from:\n'),
                    TextSpan(text: '- Your use or inability to use the app;\n'),
                    TextSpan(text: '- Any unauthorized access to or use of our servers and/or any personal information stored therein;\n'),
                    TextSpan(text: '- Any interruption or cessation of transmission to or from our app;\n'),
                    TextSpan(text: '- Any bugs, viruses, trojan horses, or the like that may be transmitted to or through our app by any third party;\n'),
                    TextSpan(text: '- Any errors or omissions in any content or for any loss or damage incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available through the app.\n\n'),

                    TextSpan(text: '6. Termination\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'We reserve the right to terminate or suspend your account and access to the app, with or without notice and for any reason, including if we believe you have violated these Terms. Upon termination, your right to use the app will immediately cease.\n\n'),

                    TextSpan(text: '7. Governing Law\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'These Terms are governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law principles. You agree to submit to the personal jurisdiction of the courts located within [Your Jurisdiction] for the purpose of litigating all such claims or disputes.\n\n'),

                    TextSpan(text: '8. Changes to Terms\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'We may revise these Terms from time to time. The most current version will always be posted on the app. By continuing to access or use the app after those revisions become effective, you agree to be bound by the revised Terms.\n\n'),

                    TextSpan(text: '9. Contact Us\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'If you have any questions about these Terms, please contact us at:\n\n[Your Contact Information]\n\n'),
                  ],
                ),
              )

            ],
          ),
        ),
      );
    } catch (e) {
      BlocProvider.of<LoggerDbCubit>(context).setLogData(
        description: CommonText.widgetExceptionText,
        screenName: screenName,
      );
      return ExceptionScreen();
    }
  }
}
