import 'package:flutter/material.dart';

const fontColour = Color(0x0ff8de98);

class IconContent extends StatelessWidget {
  IconContent({super.key, required this.icon, required this.b});
  IconData? icon;
  String? b;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        Text(b ?? '', style: const TextStyle(fontSize: 18))
      ],
    );
  }
}
