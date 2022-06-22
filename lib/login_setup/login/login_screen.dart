import 'package:flutter/material.dart';
import 'package:project_jh/components/background.dart';
import 'package:project_jh/login_setup/components/social_sign_up.dart';
import 'package:project_jh/login_setup/login/components.dart/login_form.dart';
import 'package:project_jh/login_setup/login/components.dart/login_screen_top_image.dart';
import 'package:project_jh/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(),
          desktop: DesktopLoginScreen(),
        ),
      ),
    );
  }
}

class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: LoginScreenTopImage()),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 450,
                child: LoginForm(),
              ),
              SocialSignUp(),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
        const SocialSignUp(),
      ],
    );
  }
}
