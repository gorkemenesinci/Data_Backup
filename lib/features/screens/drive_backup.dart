import 'package:flutter/material.dart';
import 'package:google_drive_storage/models/color.dart';
import 'package:google_drive_storage/models/customer.dart';
import 'package:google_drive_storage/services/firebase/customer.dart';

class DriveBackup extends StatefulWidget {
  const DriveBackup({super.key});

  @override
  State<DriveBackup> createState() => _DriveBackupState();
}

class _DriveBackupState extends State<DriveBackup> {
  Firestore firestore = Firestore();
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();

  @override
  void dispose() {
    textEditingController1.dispose();
    textEditingController2.dispose();
    textEditingController3.dispose();
    textEditingController4.dispose();
    super.dispose();
  }

  Future<void> _addSampleCustomer() async {
    Customer customer = Customer(
        companyName: textEditingController1.text,
        contactDetails: textEditingController2.text,
        contactName: textEditingController3.text,
        taxNumber: textEditingController4.text);
    await firestore.addCustomers(customer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BackgroundColor.decoration,
        ),
        title: const Text("Add"),
      ),
      body: Container(
        decoration: BackgroundColor.decoration,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textEditingController1,
              decoration: const InputDecoration(hintText: "Company Name"),
            ),
            TextField(
              controller: textEditingController2,
              decoration: const InputDecoration(hintText: "Contact Details"),
            ),
            TextField(
              controller: textEditingController3,
              decoration: const InputDecoration(hintText: "Contact Name"),
            ),
            TextField(
              controller: textEditingController4,
              decoration: const InputDecoration(hintText: "Tax Number"),
            ),
            OutlinedButton(
                onPressed: () {
                  _addSampleCustomer();
                  textEditingController1.clear();
                  textEditingController2.clear();
                  textEditingController3.clear();
                  textEditingController4.clear();
                },
                child: const Text("ekle"))
          ],
        )),
      ),
    );
  }
}
