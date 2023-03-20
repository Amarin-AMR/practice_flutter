import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
    this.colour,
    this.title, {
    super.key,
    required this.onPressed,
  });
  final Color? colour;
  final String? title;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour ?? Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onPressed!();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title ?? 'Hello',
          ),
        ),
      ),
    );
  }
}
