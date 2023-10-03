import 'package:firebase_auth/firebase_auth.dart';

User? geCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}

Future<String?> signUpUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (ex){
    return ex.code;
  }
}

Future<String?> signInUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (ex){
    return ex.code;
  }
}

updateUser() {

}

deleteUser() async {

}

Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
}