import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/home/home_screen.dart';
import 'package:project_jh/screens/login_setup/components/already_have_an_account_check.dart';
import 'package:project_jh/screens/login_setup/signup/email_pass/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  final _auth = FirebaseAuth.instance;

  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //Email Field
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: emailController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              // ignore: avoid_returning_null_for_void
              return null;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return kEmailNullError;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return kInvalidEmailError;
              }
              return null;
            },
            onSaved: (newValue) {
              emailController.text = newValue!;
            },
            decoration: const InputDecoration(
              hintText: "Your Email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(kDefaultPaddin),
                child: Icon(Icons.person),
              ),
            ),
          ),
          //Password Field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: passwordController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  removeError(error: kPassNullError);
                } else if (value.length >= 8) {
                  removeError(error: kShortPassError);
                }
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: kPassNullError);
                  return kPassNullError;
                } else if (value.length < 8) {
                  addError(error: kShortPassError);
                  return kShortPassError;
                }
                return null;
              },
              onSaved: (value) {
                passwordController.text = value!;
              },
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
          const SizedBox(height: kDefaultPaddin),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                signin(emailController.text, passwordController.text);
              },
              child: Text("Login".toUpperCase()),
            ),
          ),
          const SizedBox(
            height: kDefaultPaddin,
          ),

          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignupScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  String _error_msg = "khaifh";

  void signin(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "LoginSuccessful"),
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  ),
                });
      } catch (_error_msg) {
        print(_error_msg);
      }
      //   .catchError((e) {
      // Fluttertoast.showToast(msg: e!.msg);
      // },
      // );
    }
  }
}
