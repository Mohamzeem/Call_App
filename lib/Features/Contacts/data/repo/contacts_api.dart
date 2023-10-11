import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsApi {
  final firestore = FirebaseFirestore.instance;
  Future<List<ContactModel>> getAllContacts() async {
    var result = await firestore
        .collection(AppStrings.usersCollection)
        .doc(AppStrings.profileDocument)
        .collection(AppStrings.profileDetailsCollection)
        .orderBy('isOnline', descending: true)
        .get();
    return result.docs
        .map((value) => ContactModel.fromJson(value.data()))
        .toList();
  }
}
