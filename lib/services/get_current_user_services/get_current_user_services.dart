import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserServices {
  getCurrentUserData() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    return user;
  }
}
