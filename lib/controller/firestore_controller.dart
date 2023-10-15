import 'package:academic_advice_app/model/entities/user_entity.dart';
import 'package:academic_advice_app/model/providers/user_data_provider.dart';
import 'package:academic_advice_app/model/services/firebase_db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<bool> addData(UserEntity userData, WidgetRef ref) async {
  try{
    await addUserDataService(userData);
    ref.read(userDataProvider.notifier).state = userData;
    return true;
  } on FirebaseException catch (ex){
    return false;
  }
}