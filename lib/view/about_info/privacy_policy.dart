import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/logger_db_cubit/logger_db_cubit.dart';
import '../../components/appbar.dart';
import '../../utils/helper_text.dart';
import '../user/exception_screen.dart';

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
              Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 24.sp),
              ),
              SizedBox(height: 10.h),
              // Text(
              //     '''1. Introduction\nOur privacy policy will help you understand what information we collect at AiimsCycle, how AiimsCycle uses it, and what choices you have.
              // AiimsCycle built the AiimsCycle app as a free app. This SERVICE is provided by AiimsCycle at no cost and is intended for use as is.
              // If you choose to use our Service, then you agree to the collection and use of information in  relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible in our website, unless otherwise  defined in this Privacy Policy.\n\n 2. Information \nCollection and Use For a better experience while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to users name, email address, gender, location, pictures. The information that we request will be retained by us and used as described in this privacy policy.
              // The app does use third party services that may collect information used to identify you. \n 3.Cookies \nCookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your devices’s internal memory.
              //
              // This Services does not uses these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collection information and to improve their services. You have the option  to either accept or refuse these cookies, and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\n\n4. Service Providers
              // We may employ third-party companies and individuals due to the following reasons:
              // * To facilitate our Service;
              // * To provide the Service on our behalf;
              // * To perform Service-related services; or
              // * To assist us in analyzing how our Service is used.
              //
              // We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose. \n\n5. Security
              // We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over  the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\n\n6. Children’s Privacy
              // This Services do not address anyone under the age of 13. We do not knowingly collect personal identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you  are  a  parent  or  guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.\n\n7. Changes to This Privacy Policy
              // We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.\n\n8. Contact Us
              // If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.
              // Contact Information:
              // Email: aiims@.com'''),
              const Text('''
## Privacy Policy

### Introduction

AIIMS ("we", "our", "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use the AIIMS Cycle mobile application ("app"). By using the app, you agree to the collection and use of information in accordance with this policy. If you do not agree with the terms of this Privacy Policy, please do not use the app.

### 1. Information We Collect

1.1 *Personal Information*: We may collect personal information that you provide to us directly, such as your name, email address, phone number, and any other information you choose to provide.

1.2 *Usage Data*: We may collect information that your mobile device sends when you use our app, including but not limited to the configuration of the app when utilizing our service, the time and date of your use, and other statistics.

1.3 *Location Data*: With your consent, we may collect and process information about your actual location. We use various technologies to determine location, including IP address, GPS, and other sensors that may provide us with information on nearby devices, Wi-Fi access points, and cell towers.

### 2. How We Use Your Information

We use the information we collect in the following ways:

2.1 *To Provide and Maintain Our Service*: Including to monitor the usage of our app and to detect, prevent, and address technical issues.

2.2 *To Manage Your Account*: To manage your registration as a user of the app. The personal information you provide can give you access to different functionalities of the app that are available to you as a registered user.

2.3 *To Improve Our Service*: To understand and analyze how you use our app, so we can improve our app and develop new products, services, features, and functionality.

2.4 *To Communicate with You*: To contact you with newsletters, marketing or promotional materials, and other information that may be of interest to you. You can opt out of receiving these communications at any time.

### 3. Sharing Your Information

We do not share your personal information with third parties except in the following circumstances:

3.1 *With Your Consent*: We may share or disclose your information with your consent.

3.2 *For Legal Reasons*: We may disclose your information if required to do so by law or in response to valid requests by public authorities (e.g., a court or government agency).

3.3 *Service Providers*: We may employ third-party companies and individuals to facilitate our service, provide the service on our behalf, perform service-related services, or assist us in analyzing how our service is used. These third parties have access to your personal information only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.

### 4. Data Security

We take reasonable measures to help protect your information from loss, theft, misuse, and unauthorized access, disclosure, alteration, and destruction. However, no method of transmission over the internet or method of electronic storage is 100% secure, and we cannot guarantee absolute security.

### 5. Your Data Protection Rights

Depending on your jurisdiction, you may have the following rights regarding your personal information:

5.1 *Access*: You have the right to request copies of your personal information.

5.2 *Rectification*: You have the right to request that we correct any information you believe is inaccurate or complete information you believe is incomplete.

5.3 *Erasure*: You have the right to request that we erase your personal information, under certain conditions.

5.4 *Restrict Processing*: You have the right to request that we restrict the processing of your personal information, under certain conditions.

5.5 *Object to Processing*: You have the right to object to our processing of your personal information, under certain conditions.

5.6 *Data Portability*: You have the right to request that we transfer the information that we have collected to another organization, or directly to you, under certain conditions.

### 6. Changes to This Privacy Policy

We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.

### 7. Contact Us

If you have any questions about this Privacy Policy, please contact us at:

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
