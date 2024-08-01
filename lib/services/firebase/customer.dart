import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_drive_storage/models/customer.dart';

class Firestore {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addCustomers(Customer customer) async {
    try {
      await firebaseFirestore.collection('customers').add({
        'Company Name': customer.companyName,
        'Contact Name': customer.contactName,
        'Tax Number': customer.taxNumber,
        'Contact Details': customer.contactDetails
      });
    } catch (e) {
      FirebaseException(message: "$e", plugin: "");
    }
  }

  Future<List<Customer>> getCustomers() async {
    try {
      final querySnapshot =
          await firebaseFirestore.collection('customers').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Customer(
          companyName: data['Company Name'],
          contactName: data['Contact Name'],
          taxNumber: data['Tax Number'],
          contactDetails: data['Contact Details'],
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
