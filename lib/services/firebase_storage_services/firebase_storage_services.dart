import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageServices {
  uploadImage(File profilImage) async {
    String? downlodeUrl;
    try {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("userProfileImage")
          .child(const Uuid().v1())
          .putFile(profilImage);
      TaskSnapshot taskSnapshot = await uploadTask;
      downlodeUrl = await taskSnapshot.ref.getDownloadURL();
      print(downlodeUrl);
    } on Exception catch (e) {
      print("Hello${e}");
    }
    if (downlodeUrl != null) {
      return downlodeUrl;
    }
  }
}
