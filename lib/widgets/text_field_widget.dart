import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool obscureText;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText, 
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(color: Colors.white), 
      ),
      style: const TextStyle(color: Colors.white), 
    );
  }
}
