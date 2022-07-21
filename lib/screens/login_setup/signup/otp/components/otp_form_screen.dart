import 'package:flutter/material.dart';
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

  String? nextNode, nodeName;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1FocusNode?.dispose();
    pin2FocusNode?.dispose();
    pin3FocusNode?.dispose();
    pin4FocusNode?.dispose();
    super.dispose();
  }

  void nextField({required String value, FocusNode? focusNode}) {
    if (value.length == 1) {
      focusNode?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              otpField(nextNode: pin2FocusNode, nodeName: pin1FocusNode),
              SizedBox(width: getProportionateScreenWidth(kDefaultPaddin)),
              otpField(nextNode: pin3FocusNode, nodeName: pin2FocusNode),
              SizedBox(width: getProportionateScreenWidth(kDefaultPaddin)),
              otpField(nextNode: pin4FocusNode, nodeName: pin3FocusNode),
              SizedBox(width: getProportionateScreenWidth(kDefaultPaddin)),
              //fix error add unfocus on pin4 next node ex: pin4FocusNode.unforcus
              otpField(nextNode: pin4FocusNode, nodeName: pin4FocusNode),
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

  SizedBox otpField({FocusNode? nextNode, required nodeName}) {
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        focusNode: nodeName,
        textInputAction: TextInputAction.done,
        autofocus: true,
        obscureText: true,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: kDefaultPaddin),
        textAlign: TextAlign.center,
        onChanged: (value) {
          nextField(value: value, focusNode: nextNode);
        },
        //setup to store value
      ),
    );
  }
}
