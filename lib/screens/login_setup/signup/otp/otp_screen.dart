import 'package:flutter/material.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/login_setup/components/background.dart';
import 'package:project_jh/screens/login_setup/components/social_sign_up.dart';
import 'package:project_jh/screens/login_setup/responsive.dart';
import 'package:project_jh/screens/login_setup/signup/otp/components/opt_screen_top_image.dart';

import 'components/otp_form_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobileOTPScreen(),
            desktop: DesktopOTPScreen(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text("OTP Verification"),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}

class MobileOTPScreen extends StatelessWidget {
  const MobileOTPScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const OtpScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: OtpFormScreen(),
            ),
            Spacer(),
          ],
        )
      ],
    );
  }
}

class DesktopOTPScreen extends StatelessWidget {
  const DesktopOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: OtpScreenTopImage()),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 450,
              child: OtpFormScreen(),
            ),
            SizedBox(
              height: kDefaultPaddin / 2,
            ),
            SocialSignUp(),
          ],
        ))
      ],
    );
  }
}
