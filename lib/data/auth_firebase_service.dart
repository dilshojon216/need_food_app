import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> signUpUser(String? email, String? password) async {
    return _auth
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((user) {
      return user;
    }).catchError((e) {
      print(e);
      return e;
    });
  }

  Future<dynamic> signInUser(String email, String password) {
    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      return user;
    }).catchError((e) {
      print(e);
      return e;
    });
  }

  Future<bool> signOut() async {
    return _auth.signOut().then((_) {
      return true;
    }).catchError((e) {
      print(e);
      return false;
    });
  }

  Future<bool> chekadUser() async {
    var currentUser = _auth.currentUser;
    return currentUser != null;
  }
}
