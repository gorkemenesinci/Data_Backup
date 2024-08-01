import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/widgets/first_container.dart';
import 'package:google_drive_storage/features/widgets/second_container.dart';
import 'package:google_drive_storage/features/utils/color.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundColor.decoration,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [FirstContainer(), SizedBox(height: 30), SecondContainer()],
        ),
      ),
    );
  }
}
