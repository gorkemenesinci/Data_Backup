import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/screens/add_firebase.dart';
import 'package:google_drive_storage/features/utils/color.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key});

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
                image: AssetImage("assets/images/list.png"),
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
                    builder: (context) => const AddFirebase(),
                  ),
                );
              },
              child: const Text(
                "Add To Database",
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
