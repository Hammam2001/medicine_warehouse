import 'package:flutter/material.dart';

class TextFiledApp extends StatelessWidget {
  const TextFiledApp({super.key,
  required this.controller,
  required this.type,
   this.prefix,
  required this.label,
   required this.obscurePassword,
    this.suffix,
  });
  final TextEditingController ? controller;
  final TextInputType ? type;
  final String ? label;
  final IconData ? prefix;
  final bool   obscurePassword;
  final  IconData ? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.orangeAccent,
    controller: controller,
      keyboardType: type,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: Icon(suffix),
        border: const OutlineInputBorder(),

      ),
    );
  }
}
