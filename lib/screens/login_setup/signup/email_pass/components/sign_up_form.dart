import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/login_setup/components/already_have_an_account_check.dart';
import 'package:project_jh/screens/login_setup/components/form_error.dart';
import 'package:project_jh/screens/login_setup/login/login_screen.dart';
import 'package:project_jh/screens/login_setup/signup/complete_profile/signup_details_screen.dart';
import 'package:project_jh/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  // final TextEditingController _userNameTextController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirm_password;
  String? name;
  String? num;
  // String? DOB;

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
      key: _formkey,
      child: Column(
        children: [
          buildEmailFormField(), //Email
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildPasswordFormField(), //Password
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildConfirmPasswordFormField(), //Confirm Password
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          // FormError(errors: errors),
          // const SizedBox(height: kDefaultPaddin / 2),
          Hero(
            tag: "sign_up_next",
            child: buildContinueButton(context), //button
          ),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin / 2)),
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

  ElevatedButton buildContinueButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // FirebaseAuth.instance
        //     .createUserWithEmailAndPassword(
        //         email: _emailTextController.text,
        //         password: _passwordTextController.text)
        //     .then((value) {
        //   FirebaseFirestore.instance
        //       .collection('UserData')
        //       .doc(value.user?.uid)
        //       .set({
        //     "email": value.user?.email,
        //     "name": name,
        //   });
        // });
        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SignupDetailsScreen()),
          );
          // if all are valid then go to success screen

        }
      },
      child: Text(
        "Continue".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: kPrimaryLightColor),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: _passwordTextController,
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && value == confirm_password) {
          removeError(error: kMatchPassError);
        }
        confirm_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return kPassNullError;
        } else if (password != value) {
          addError(error: kMatchPassError);
          return kMatchPassError;
        }
        return null;
      },
      obscureText: true,
      cursorColor: kPrimaryColor,
      decoration: const InputDecoration(
        hintText: "Confirm Password",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordTextController,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => password = newValue,
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
      obscureText: true,
      cursorColor: kPrimaryColor,
      decoration: const InputDecoration(
        hintText: "Password",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailTextController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onSaved: (newValue) => email = newValue,
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
      decoration: const InputDecoration(
        hintText: "Email Address",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.person),
        ),
      ),
    );
  }
}
