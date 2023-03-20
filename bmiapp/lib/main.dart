import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const BMICal());
}

class BMICal extends StatelessWidget {
  const BMICal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),

        // textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xFFFFFFFFF)))
      ),
      home: const InputPage(),
    );
  }
}
