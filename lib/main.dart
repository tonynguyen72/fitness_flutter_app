import 'package:flutter/material.dart';

import 'screens/onboarding_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xff192a56))),
      home: OnBoardingScreen(),
    );
  }
}
