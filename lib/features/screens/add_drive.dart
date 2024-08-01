import 'package:flutter/material.dart';
import 'package:google_drive_storage/features/screens/company_details.dart';
import 'package:google_drive_storage/features/utils/color.dart';
import 'package:google_drive_storage/models/customer.dart';
import 'package:google_drive_storage/services/firebase/customer.dart';

class AddDrive extends StatefulWidget {
  const AddDrive({super.key});

  @override
  State<AddDrive> createState() => _AddDriveState();
}

class _AddDriveState extends State<AddDrive> {
  Firestore firestore = Firestore();
  List<Customer> _customers = [];
  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  Future<void> fetchCustomers() async {
    try {
      List<Customer> customers = await firestore.getCustomers();
      setState(() {
        _customers = customers;
      });
    } catch (e) {
      print("$e");
    }
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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _customers.length,
                itemBuilder: (context, index) {
                  final customer = _customers[index];
                  return ListTile(
                    title: Text(customer.companyName),
                    subtitle: Text(customer.contactDetails),
                    titleAlignment: ListTileTitleAlignment.center,
                    trailing: TextButton(
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CompanyDetails(
                                  companyName: customer.companyName,
                                  contactDetails: customer.contactDetails,
                                  contactName: customer.contactName,
                                  taxNumber: customer.taxNumber,
                                )));
                      },
                      child: const Text(
                        "Data Details",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
