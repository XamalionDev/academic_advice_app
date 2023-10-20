import 'package:academic_advice_app/model/services/firebase_auth_service.dart';

Future<String> signIn(String email, String password) async {
  return await signInUserService(email, password) ?? 'Success';
}

Future<String> signUp(String email, String password) async {
  return await signUpUserService(email, password) ?? 'Success';
}

Future<void> signOut() async {
  await signOutUserService();
}

Future<bool> getUser() async {
  //String? email = getCurrentUser()?.email;
  return (getCurrentUserService()?.email == null) ? false : true;
}

Future<String> resetPassword(String email) async {
  return await resetPasswordService(email) ?? 'Success';
}