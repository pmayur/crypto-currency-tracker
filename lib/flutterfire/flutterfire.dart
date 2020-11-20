import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signUp(
    String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> login(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> buttonPressed(bool isLoginPage, String email, String password,
    String passwordConfirmation) async {
  if (isLoginPage) {
    return await login(email, passwordConfirmation);
  
  } else {
    if(password != passwordConfirmation) return Future.value(false);
    
    return await signUp(email, password);
  }
}
