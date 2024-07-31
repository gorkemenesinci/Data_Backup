import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/widgets/signup_textfield.dart';
import 'package:google_drive_storage/features/utils/color.dart';
import 'package:google_drive_storage/models/customer.dart';

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
            mainAxisSize: MainAxisSize.min,
            children: [
              SignupTextfield(
                labelText: "Company Name : ${customer.companyName}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              SignupTextfield(
                labelText: "Contact Details : ${customer.contactDetails}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              SignupTextfield(
                labelText: "Contact Name : ${customer.contactName}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
              SignupTextfield(
                labelText: "Tax Number : ${customer.taxNumber}",
                labelStyle: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
