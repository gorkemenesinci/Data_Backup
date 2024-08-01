import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_drive_storage/features/widgets/signup_textfield.dart';
import 'package:google_drive_storage/features/utils/color.dart';
import 'package:google_drive_storage/models/customer.dart';
import 'package:google_drive_storage/services/google/google_auth_client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:path_provider/path_provider.dart';

class CompanyDetails extends StatefulWidget {
  final String companyName;
  final String contactName;
  final String taxNumber;
  final String contactDetails;
  const CompanyDetails(
      {super.key,
      required this.companyName,
      required this.contactDetails,
      required this.contactName,
      required this.taxNumber});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  late Customer customer;
  final GoogleSignIn _googleSignIn =
      GoogleSignIn.standard(scopes: [drive.DriveApi.driveFileScope]);

  @override
  void initState() {
    customer = Customer(
        companyName: widget.companyName,
        contactDetails: widget.contactDetails,
        contactName: widget.contactName,
        taxNumber: widget.taxNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final horizantal = screenWidth * 0.3;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BackgroundColor.decoration,
        ),
      ),
      body: Container(
        decoration: BackgroundColor.decoration,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.2,
                child: const Image(
                  image: AssetImage("assets/images/google-drive.png"),
                ),
              ),
              SignupTextfield(
                enabled: false,
                labelText: "Company Name : ${customer.companyName}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              SignupTextfield(
                enabled: false,
                labelText: "Contact Details : ${customer.contactDetails}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              SignupTextfield(
                enabled: false,
                labelText: "Contact Name : ${customer.contactName}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              SignupTextfield(
                enabled: false,
                labelText: "Tax Number : ${customer.taxNumber}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shadowColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: horizantal)),
                onPressed: _uploadToGoogleDrive,
                child: const Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _uploadToGoogleDrive() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        Fluttertoast.showToast(msg: "Entry Cancelled");
        return;
      }

      final authHeaders = await account.authHeaders;
      final authenticateClient = GoogleAuthClient(authHeaders);
      final driveApi = drive.DriveApi(authenticateClient);

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/${customer.companyName}');
      final customerData = '''
Company Name: ${customer.companyName}
Contact Details: ${customer.contactDetails}
Contact Name: ${customer.contactName}
Tax Number: ${customer.taxNumber}
''';
      await file.writeAsString(customerData);

      final driveFile = drive.File();
      driveFile.name = "${customer.companyName}.txt";
      await driveApi.files.create(
        driveFile,
        uploadMedia: drive.Media(file.openRead(), file.lengthSync()),
      );

      Fluttertoast.showToast(msg: "Added to Google Drive");
    } catch (error) {
      Fluttertoast.showToast(msg: "Error : $error");
    }
  }
}
