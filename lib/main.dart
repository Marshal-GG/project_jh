import 'package:flutter/material.dart';
import 'package:project_jh/constants.dart';
import 'package:project_jh/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project JH',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.cyan,
      ),
      home: const HomeScreen(),
    );
  }
}
