import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/home/home_screen.dart';
import 'package:project_jh/screens/login_setup/components/already_have_an_account_check.dart';
import 'package:project_jh/screens/login_setup/login/login_screen.dart';

class SignupDetailsForm extends StatefulWidget {
  const SignupDetailsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupDetailsForm> createState() => _SignupDetailsFormState();
}

class _SignupDetailsFormState extends State<SignupDetailsForm> {
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: TextFormField(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: TextFormField(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
            child: DateTimeField(
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              onSaved: (DOB) {},
              decoration: const InputDecoration(
                hintText: "Date of Birth",
                suffixIcon: Padding(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  child: null,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(kDefaultPaddin),
                  child: Icon(Icons.event),
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
            ),
          ),

          const SizedBox(height: kDefaultPaddin / 2),
          ElevatedButton(
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
          ),
          // DOB(),
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
          ),
        ],
      ),
    );
  }
}
