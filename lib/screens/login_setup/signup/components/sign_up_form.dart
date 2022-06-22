import 'package:flutter/material.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/login_setup/components/already_have_an_account_check.dart';
import 'package:project_jh/screens/login_setup/login/login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your Email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(kDefaultPaddin),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPaddin / 2),
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: kDefaultPaddin),
          // Add Code Here

          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
