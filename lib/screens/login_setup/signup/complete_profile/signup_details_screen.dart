import 'package:flutter/material.dart';
import 'package:project_jh/screens/login_setup/components/background.dart';
import 'package:project_jh/screens/login_setup/components/social_sign_up.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/login_setup/responsive.dart';
import 'package:project_jh/screens/login_setup/signup/complete_profile/components/complete_profile_top_image.dart';
import 'package:project_jh/screens/login_setup/signup/complete_profile/components/signup_details_form.dart';

class SignupDetailsScreen extends StatelessWidget {
  const SignupDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar2(),
      body: const Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobileSignUpScreen(),
            desktop: DesktopSignUpScreen(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar2() {
    return AppBar(
      elevation: 0,
      title: const Text("Sign Up"),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }
}

class DesktopSignUpScreen extends StatelessWidget {
  const DesktopSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CompleteProfileTopImage(),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 450,
                child: SignupDetailsForm(),
              ),
              SizedBox(
                height: kDefaultPaddin / 2,
              ),
              SocialSignUp(),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CompleteProfileTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignupDetailsForm(),
            ),
            Spacer(),
          ],
        ),
        const SocialSignUp()
      ],
    );
  }
}
