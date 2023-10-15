import 'package:academic_advice_app/model/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUserDataService(UserEntity userData) async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
  await collectionReference.doc(userData.email).set(userData.toJson());
}

getUserDataService() {

}

updateUserDataService() {

}