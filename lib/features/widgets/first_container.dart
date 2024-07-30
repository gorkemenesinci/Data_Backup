import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/screens/drive_backup.dart';
import 'package:google_drive_storage/models/color.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key});

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
                image: AssetImage("assets/images/google-drive.png"),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shadowColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 10),
                  padding: EdgeInsets.symmetric(horizontal: horizantal)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DriveBackup(),
                  ),
                );
              },
              child: const Text(
                "Add to Database",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
