import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  singUp({required String email, required String password}) async {
    const storage = FlutterSecureStorage();
    UserCredential userCredential;
    try {
       userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await storage.write(key: "uid", value: userCredential.user?.uid);
    } catch (e) {
      rethrow;
    }
    return userCredential;
  }

  login({required String email, required String password}) async {
    const storage = FlutterSecureStorage();
    UserCredential userCredential;
    try {
       userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await storage.write(key: "uid", value: userCredential.user?.uid);
    } catch (e) {
      rethrow;
    }
    return userCredential;
  }

  resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {})
          .catchError((onError) {
        print(onError);
      });
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }
}
