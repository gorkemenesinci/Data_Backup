import 'package:flutter/material.dart';
import 'package:google_drive_storage/models/color.dart';
import 'package:google_drive_storage/models/customer.dart';
import 'package:google_drive_storage/services/firebase/customer.dart';

class BackupView extends StatefulWidget {
  const BackupView({super.key});

  @override
  State<BackupView> createState() => _BackupViewState();
}

class _BackupViewState extends State<BackupView> {
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
    } catch (e) {}
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
                    titleAlignment: ListTileTitleAlignment.center,
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("data"),
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
