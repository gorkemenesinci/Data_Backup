import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/screens/add_drive.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizantal = screenWidth * 0.3;

    return Center(
      child: Container(
        color: Colors.transparent,
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
                  textStyle: const TextStyle(fontSize: 20),
                  padding: EdgeInsets.symmetric(horizontal: horizantal)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddDrive(),
                  ),
                );
              },
              child: const Text(
                "Add To Google Drive",
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
