
import 'package:flutter/material.dart';

class SayMonitor extends StatelessWidget {
  final String sayText;

  const SayMonitor({Key? key, required this.sayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        sayText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
