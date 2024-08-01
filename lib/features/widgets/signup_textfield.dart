import 'package:flutter/material.dart';

class SignupTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final bool? enabled;

  const SignupTextfield({
    super.key,
    required this.labelText,
    this.controller,
    this.enabled,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            labelText: labelText,
            labelStyle: labelStyle),
      ),
    );
  }
}
