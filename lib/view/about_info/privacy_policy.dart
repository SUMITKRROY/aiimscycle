import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/helper_text.dart';
import '../extra_screen/exception_screen.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  final String screenName = 'Privacy Policy';

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
                    TextSpan(text: 'Privacy Policy\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),

                    TextSpan(text: 'Introduction\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'AIIMS ("we", "our", "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use the AIIMS Cycle mobile application ("app"). By using the app, you agree to the collection and use of information in accordance with this policy. If you do not agree with the terms of this Privacy Policy, please do not use the app.\n\n'),

                    TextSpan(text: '1. Information We Collect\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: '1.1 *Personal Information*: We may collect personal information that you provide to us directly, such as your name, email address, phone number, and any other information you choose to provide.\n\n'),
                    TextSpan(text: '1.2 *Usage Data*: We may collect information that your mobile device sends when you use our app, including but not limited to the configuration of the app when utilizing our service, the time and date of your use, and other statistics.\n\n'),
                    TextSpan(text: '1.3 *Location Data*: With your consent, we may collect and process information about your actual location. We use various technologies to determine location, including IP address, GPS, and other sensors that may provide us with information on nearby devices, Wi-Fi access points, and cell towers.\n\n'),

                    TextSpan(text: '2. How We Use Your Information\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'We use the information we collect in the following ways:\n\n'),
                    TextSpan(text: '2.1 *To Provide and Maintain Our Service*: Including to monitor the usage of our app and to detect, prevent, and address technical issues.\n\n'),
                    TextSpan(text: '2.2 *To Manage Your Account*: To manage your registration as a user of the app. The personal information you provide can give you access to different functionalities of the app that are available to you as a registered user.\n\n'),
                    TextSpan(text: '2.3 *To Improve Our Service*: To understand and analyze how you use our app, so we can improve our app and develop new products, services, features, and functionality.\n\n'),
                    TextSpan(text: '2.4 *To Communicate with You*: To contact you with newsletters, marketing or promotional materials, and other information that may be of interest to you. You can opt out of receiving these communications at any time.\n\n'),

                    TextSpan(text: '3. Sharing Your Information\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'We do not share your personal information with third parties except in the following circumstances:\n\n'),
                    TextSpan(text: '3.1 *With Your Consent*: We may share or disclose your information with your consent.\n\n'),
                    TextSpan(text: '3.2 *For Legal Reasons*: We may disclose your information if required to do so by law or in response to valid requests by public authorities (e.g., a court or government agency).\n\n'),
                    TextSpan(text: '3.3 *Service Providers*: We may employ third-party companies and individuals to facilitate our service, provide the service on our behalf, perform service-related services, or assist us in analyzing how our service is used. These third parties have access to your personal information only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.\n\n'),

                    TextSpan(text: '4. Data Security\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'We take reasonable measures to help protect your information from loss, theft, misuse, and unauthorized access, disclosure, alteration, and destruction. However, no method of transmission over the internet or method of electronic storage is 100% secure, and we cannot guarantee absolute security.\n\n'),

                    TextSpan(text: '5. Your Data Protection Rights\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'Depending on your jurisdiction, you may have the following rights regarding your personal information:\n\n'),
                    TextSpan(text: '5.1 *Access*: You have the right to request copies of your personal information.\n\n'),
                    TextSpan(text: '5.2 *Rectification*: You have the right to request that we correct any information you believe is inaccurate or complete information you believe is incomplete.\n\n'),
                    TextSpan(text: '5.3 *Erasure*: You have the right to request that we erase your personal information, under certain conditions.\n\n'),
                    TextSpan(text: '5.4 *Restrict Processing*: You have the right to request that we restrict the processing of your personal information, under certain conditions.\n\n'),
                    TextSpan(text: '5.5 *Object to Processing*: You have the right to object to our processing of your personal information, under certain conditions.\n\n'),
                    TextSpan(text: '5.6 *Data Portability*: You have the right to request that we transfer the information that we have collected to another organization, or directly to you, under certain conditions.\n\n'),

                    TextSpan(text: '6. Changes to This Privacy Policy\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n\n'),

                    TextSpan(text: '7. Contact Us\n\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: 'If you have any questions about this Privacy Policy, please contact us at:\n\n[Your Contact Information]\n\n'),
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
