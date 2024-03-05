import 'package:HelpingHand/models/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService({required this.uid});
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('Users');


  Future setUserData(String phoneNumber, String name) async {
    return await userDataCollection
        .doc(uid)
        .set({'Full Name': name, 'Phone Number': phoneNumber, 'Address': ''});
  }

  Future updateUserData(String phoneNumber, String name, String address) async {
    return await userDataCollection.doc(uid).set(
        {'Full Name': name, 'Phone Number': phoneNumber, 'Address': address});
  }

}
