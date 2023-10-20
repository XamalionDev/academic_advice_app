import 'package:firebase_auth/firebase_auth.dart';

User? getCurrentUserService() {
  return FirebaseAuth.instance.currentUser;
}

Future<String?> signUpUserService(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (ex){
    return ex.code;
  }
}

Future<String?> signInUserService(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (ex){
    return ex.code;
  }
}

Future<String?> resetPasswordService(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return null;
  } on FirebaseAuthException catch(ex) {
    return ex.code;
  }
}

updateUserService() {

}

deleteUserService() async {

}

Future<void> signOutUserService() async {
  await FirebaseAuth.instance.signOut();
}