import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_drive_storage/features/widgets/signup_textfield.dart';
import 'package:google_drive_storage/features/utils/color.dart';
import 'package:google_drive_storage/models/customer.dart';
import 'package:google_drive_storage/services/firebase/customer.dart';

class AddFirebase extends StatefulWidget {
  const AddFirebase({super.key});

  @override
  State<AddFirebase> createState() => _AddFirebaseState();
}

class _AddFirebaseState extends State<AddFirebase> {
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
    if (textEditingController1.text.trim() == "" &&
        textEditingController2.text.trim() == "" &&
        textEditingController3.text.trim() == "" &&
        textEditingController4.text.trim() == "") {
      Fluttertoast.showToast(msg: "These Cannot Are Empty");
    } else {
      Fluttertoast.showToast(msg: "Register is Succesfully");
      await firestore.addCustomers(customer);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizantal = screenWidth * 0.3;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BackgroundColor.decoration,
        ),
        title: const Text("Add"),
      ),
      body: Container(
        decoration: BackgroundColor.decoration,
        child: Form(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignupTextfield(
                  labelText: "Company Name :",
                  labelStyle: const TextStyle(color: Colors.black),
                  controller: textEditingController1),
              const SizedBox(height: 20),
              SignupTextfield(
                  labelText: "Contact Details : ",
                  labelStyle: const TextStyle(color: Colors.black),
                  controller: textEditingController2),
              const SizedBox(height: 20),
              SignupTextfield(
                  labelText: "Contact Name : ",
                  labelStyle: const TextStyle(color: Colors.black),
                  controller: textEditingController3),
              const SizedBox(height: 20),
              SignupTextfield(
                  labelText: "Tax Number :",
                  labelStyle: const TextStyle(color: Colors.black),
                  controller: textEditingController4),
              const SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shadowColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: horizantal)),
                onPressed: () {
                  _addSampleCustomer();
                  textEditingController1.clear();
                  textEditingController2.clear();
                  textEditingController3.clear();
                  textEditingController4.clear();
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
