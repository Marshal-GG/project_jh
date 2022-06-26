import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_jh/constants.dart';

class datetime extends StatelessWidget {
  datetime({Key? key}) : super(key: key);
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPaddin),
          child: DateTimeField(
            format: format,
            onShowPicker: (context, picker) async {
              final date = showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (context, picker) {
                  return Theme(
                    data: ThemeData.dark().copyWith(
                      colorScheme: const ColorScheme.dark(
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
      ),
    );
  }
}
