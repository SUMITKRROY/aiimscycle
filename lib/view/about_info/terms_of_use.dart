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
              Text(
                "Terms of Use",
                style: TextStyle(fontSize: 24.sp),
              ),
              SizedBox(height: 10.h),
              //           Text('''1. Information We Collect:\n
              // - We collect the following information to ensure secure and personalized access to our services:\n- Patient's mobile number for account authentication\n- Patient's email address for communication and updates\n- Unique Hospital Identification (UHID) for patient identity verification\n- Location: With user consent, we may collect location information to provide location-based services and enhance user experience.\n- Camera: We may access the device's camera functionality for specific features such as uploading images or documents, but this access is contingent upon user permission.\n- Gallery: Access to the device's gallery may be requested to allow users to upload images or documents, again, contingent upon user consent.\n- Microphone: We may request access to the device's microphone for certain features such as voice messaging, with user permission.\n- Phone: i want to know about the application info #collect proper data\n\n
              // 2. Use of Information:\n
              // - We utilize the collected information for the following purposes:\n- Secure identity verification of patients\n- Timely communication with patients regarding grievance resolution updates\n - Enhancing and customizing our services to meet user needs\n
              // 3. Information Sharing:\n
              // - Patient information is strictly confidential and will not be shared with any third parties unless required by law or with explicit user consent.\n
              // 4. Security:\n
              // - We employ robust security measures to safeguard all collected information against unauthorized access, alteration, disclosure, or destruction.\n
              // 5. Changes to Privacy Policy:\n
              // - Any updates or modifications to our privacy policy will be promptly communicated to users through the application or via email.\n
              // 6. Contact Us:\n
              // - For any inquiries or concerns regarding our privacy practices, please contact us at privacy[at]santushtapp[dot]com.\n
              // '''),
              const Text('''

## Terms and Conditions

### Introduction

Welcome to AIIMS Cycle, a mobile application provided by AIIMS ("we", "our", "us"). By downloading, accessing, or using the AIIMS Cycle app, you agree to comply with and be bound by these Terms and Conditions ("Terms"). If you do not agree to these Terms, please do not use the AIIMS Cycle app.

### 1. Use of the App

1.1 *Eligibility*: You must be AIIMS employee to use this app. By using the app, you represent and warrant that you are AIIMS employee.

1.2 *License*: We grant you a non-exclusive, non-transferable, revocable license to use the AIIMS Cycle app for your personal, non-commercial use, subject to these Terms.

1.3 *Prohibited Uses*: You agree not to use the app for any unlawful purpose or in a way that infringes the rights of, restricts, or inhibits anyone else's use and enjoyment of the app.

### 2. User Account

2.1 *Account Creation*: To use certain features of the app, you may be required to create an account. You agree to provide accurate and complete information when creating your account and to keep this information up to date.

2.2 *Account Security*: You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account.

### 3. Privacy

Your privacy is important to us. Please review our Privacy Policy, which explains how we collect, use, and disclose information that pertains to your privacy. By using the app, you consent to the collection and use of your information as outlined in the Privacy Policy.

### 4. Intellectual Property

4.1 *Ownership*: All content, features, and functionality of the app, including but not limited to text, graphics, logos, icons, images, and software, are the exclusive property of AIIMS and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.

4.2 *Restrictions*: You may not modify, reproduce, distribute, create derivative works of, publicly display, publicly perform, republish, download, store, or transmit any of the material on our app, except as automatically and incidentally occurs in the course of using the app for its intended purpose.

### 5. Limitation of Liability

To the fullest extent permitted by law, AIIMS shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from:
- Your use or inability to use the app;
- Any unauthorized access to or use of our servers and/or any personal information stored therein;
- Any interruption or cessation of transmission to or from our app;
- Any bugs, viruses, trojan horses, or the like that may be transmitted to or through our app by any third party;
- Any errors or omissions in any content or for any loss or damage incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available through the app.

### 6. Termination

We reserve the right to terminate or suspend your account and access to the app, with or without notice and for any reason, including if we believe you have violated these Terms. Upon termination, your right to use the app will immediately cease.

### 7. Governing Law

These Terms are governed by and construed in accordance with the laws of [Your Jurisdiction], without regard to its conflict of law principles. You agree to submit to the personal jurisdiction of the courts located within [Your Jurisdiction] for the purpose of litigating all such claims or disputes.

### 8. Changes to Terms

We may revise these Terms from time to time. The most current version will always be posted on the app. By continuing to access or use the app after those revisions become effective, you agree to be bound by the revised Terms.

### 9. Contact Us

If you have any questions about these Terms, please contact us at:

[Your Contact Information]
'''),
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
