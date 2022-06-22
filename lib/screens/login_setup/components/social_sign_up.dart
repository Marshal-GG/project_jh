import 'package:flutter/material.dart';
import 'package:project_jh/screens/login_setup/components/social_icon.dart';
import 'package:project_jh/screens/login_setup/components/or_divider.dart';
import 'package:project_jh/screens/home/home_screen.dart';

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIcon(
              iconsrc: "assets/icons/facebook.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
            ),
            SocialIcon(
              iconsrc: "assets/icons/google.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
