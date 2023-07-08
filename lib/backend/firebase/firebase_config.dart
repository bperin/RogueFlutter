import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA8o08CkkRw3Knfzi5S92R5JHh03qcYvcU",
            authDomain: "rogue-develop.firebaseapp.com",
            projectId: "rogue-develop",
            storageBucket: "rogue-develop.appspot.com",
            messagingSenderId: "557838041714",
            appId: "1:557838041714:web:46da84b3d1af1ac2a2f8eb",
            measurementId: "G-3E415Z6P7D"));
  } else {
    await Firebase.initializeApp();
  }
}
