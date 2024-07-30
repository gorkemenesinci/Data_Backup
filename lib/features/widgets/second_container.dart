import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_drive_storage/features/screens/backup_view.dart';
import 'package:google_drive_storage/models/color.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizantal = screenWidth * 0.3;

    return Center(
      child: Container(
        decoration: ContainerColor.decoration,
        width: screenWidth,
        height: screenHeight * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.2,
              child: const Image(
                image: AssetImage("assets/images/list.png"),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  padding: EdgeInsets.symmetric(horizontal: horizantal)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BackupView(),
                  ),
                );
              },
              child: const Text(
                "Database Data View",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
