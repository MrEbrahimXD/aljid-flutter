import 'package:aljid/HomePage.dart';
import 'package:aljid/SignUpPage.dart';
import 'package:flutter/material.dart';

// Firebase ************** Firebase
import 'package:aljid/firebase_options.dart';

// Size Config ************** Size Config
import 'Utilities/SizeConfig.dart';

// FIrebase ************** Auth
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// FireBase ************** FireStore
import 'package:cloud_firestore/cloud_firestore.dart';

const themeColor = Color(0xFF142E2B);
const itemsInThemeColor = Color(0xFFEAD67F);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: MaterialApp(
        title: 'Aljid',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          "/": (context) => const SignUpPage(),
          "/home": (context) => const HomePage(),
        },
      ),
    );
  }
}

// Sign In Function
Future<UserCredential?> signInWithEmailAndPassword(
    String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return null;
  }
}

// Sign Up Function
Future<void> signUpWithEmailAndPassword(
    String email, String password, String name) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Save user info in Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'name': name,
      'email': email,
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
