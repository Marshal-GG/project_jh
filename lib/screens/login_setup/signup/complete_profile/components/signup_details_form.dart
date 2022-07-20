import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/home/home_screen.dart';
import 'package:project_jh/screens/login_setup/components/already_have_an_account_check.dart';
import 'package:project_jh/size_config.dart';

class SignupDetailsForm extends StatefulWidget {
  const SignupDetailsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupDetailsForm> createState() => _SignupDetailsFormState();
}

class _SignupDetailsFormState extends State<SignupDetailsForm> {
  TextEditingController phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildFullNameFormField(), //Full Name
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildPhoneNumberFormField(), //Phone Number
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildDOBFormField(), //DOB
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (name) {},
            decoration: const InputDecoration(
              hintText: "Your Address",
              prefixIcon: Padding(
                padding: EdgeInsets.all(kDefaultPaddin),
                child: Icon(Icons.location_city),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildSignUpButton(context), //Button
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          // Add Code Here

          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }

  ElevatedButton buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
      },
      child: Text("Sign Up".toUpperCase()),
    );
  }

  DateTimeField buildDOBFormField() {
    return DateTimeField(
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      onSaved: (DOB) {},
      decoration: const InputDecoration(
        hintText: "Date of Birth",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.event),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: null,
        ),
      ),
      format: format,
      onShowPicker: (context, picker) async {
        final date = showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          builder: (context, picker) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: kPrimaryColor,
                  onPrimary: Colors.white,
                  surface: kPrimaryColor,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: kPrimaryLightColor,
              ),
              child: picker!,
            );
          },
        );
        return date;
      },
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      // ignore: avoid_types_as_parameter_names
      onSaved: (num) {},
      decoration: const InputDecoration(
        hintText: "Phone Number",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.call),
        ),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      onSaved: (name) {},
      decoration: const InputDecoration(
        hintText: "Full Name",
        prefixIcon: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: Icon(Icons.person),
        ),
      ),
    );
  }
}
