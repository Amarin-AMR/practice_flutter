import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Widget data;
  final Color colour;
  final VoidCallback onPress;

  const ReuseableCard({
    super.key,
    required this.data,
    required this.colour,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: data,
      ),
    );
  }
}
