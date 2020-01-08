import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp(String _email, String _pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _pass);
      FirebaseUser user = result.user;
      return user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future login(String _email, String _pass) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _pass);
      FirebaseUser _user = result.user;
      return _user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getCurrentUser() async {
    return await _auth.currentUser();
  }

  Future signOut() async {
    return await _auth.signOut();    
  }

}
