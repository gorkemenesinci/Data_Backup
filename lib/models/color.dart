import 'package:flutter/material.dart';

class BackgroundColor {
  static const decoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.greenAccent],
      begin: Alignment.topLeft,
      end: Alignment.topRight,
    ),
  );
}

class ContainerColor {
  static final decoration = BoxDecoration(
      gradient: const LinearGradient(
        colors: [Colors.blue, Colors.greenAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20));
}
