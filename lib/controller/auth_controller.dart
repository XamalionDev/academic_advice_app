import 'package:academic_advice_app/model/services/firebase_auth_service.dart';

Future<String> signIn(String email, String password) async {
  return await signInUser(email, password) ?? 'Success';
}

Future<String> signUp(String email, String password) async {
  return await signUpUser(email, password) ?? 'Success';
}

Future<void> signOut() async {
  await signOutUser();
}

Future<bool> getUser() async {
  //String? email = getCurrentUser()?.email;
  return (getCurrentUser()?.email == null) ? false : true;
}