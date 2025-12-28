import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'constants.dart';

void main() {
  runApp(const EasyBudgetApp());
}

class EasyBudgetApp extends StatelessWidget {
  const EasyBudgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyBudget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        brightness: Brightness.dark,
        fontFamily: 'Roboto', // Default fallback
        primaryColor: kPrimaryColorBegin,
        colorScheme: ColorScheme.dark(
          primary: kPrimaryColorBegin,
          secondary: kPrimaryColorEnd,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
