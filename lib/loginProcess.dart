import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login(String _email, String _pass) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: _email.toString(), password: _pass.toString());
      FirebaseUser _user = result.user;
      return _user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
