import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/widgets/first_container.dart';
import 'package:google_drive_storage/features/widgets/second_container.dart';
import 'package:google_drive_storage/models/color.dart';

class DriveStorage extends StatefulWidget {
  const DriveStorage({super.key});

  @override
  State<DriveStorage> createState() => _DriveStorageState();
}

class _DriveStorageState extends State<DriveStorage> {
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
