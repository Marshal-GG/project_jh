import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/size_config.dart';

class OtpFormScreen extends StatefulWidget {
  const OtpFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpFormScreen> createState() => _OtpFormScreenState();
}

class _OtpFormScreenState extends State<OtpFormScreen> {
  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  final _formKey = GlobalKey<FormState>();

  String? pin;

  // @override
  // void initState() {
  //   super.initState();
  //   pin1FocusNode = FocusNode();
  //   pin2FocusNode = FocusNode();
  //   pin3FocusNode = FocusNode();
  //   pin4FocusNode = FocusNode();
  // }

  // @override
  // void dispose() {
  //   pin1FocusNode?.dispose();
  //   pin2FocusNode?.dispose();
  //   pin3FocusNode?.dispose();
  //   pin4FocusNode?.dispose();
  //   super.dispose();
  // }

  // void nextField({required String value, FocusNode? focusNode}) {
  //   if (value.length == 1) {
  //     focusNode?.requestFocus();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otpField(pin: pin1FocusNode),
              const Spacer(),
              otpField(pin: pin2FocusNode),
              const Spacer(),
              otpField(pin: pin3FocusNode),
              const Spacer(),
              //fix error add unfocus on pin4 next node ex: pin4FocusNode.unforcus
              otpField(pin: pin4FocusNode),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(kDefaultPaddin)),
          buildSubmitButton(),
        ],
      ),
    );
  }

  ElevatedButton buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Submit".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: kPrimaryLightColor),
      ),
    );
  }

  SizedBox otpField({FocusNode? pin}) {
    return SizedBox(
      width: 64,
      height: 68,
      child: TextFormField(
        // decoration: InputDecoration(hintText: "*"),
        textInputAction: TextInputAction.done,
        autofocus: true,
        obscureText: true,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: const TextStyle(fontSize: kDefaultPaddin),
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (pin) {},
        //setup to store value
      ),
    );
  }
}
