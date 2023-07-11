import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required context}) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showError(context, e.code);
    }
  }

  void showError(context, String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              error,
              style: const TextStyle(color: kwhitwcolor),
            ),
          ),
        );
      },
    );
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String rePassword,
      required String username,
      required String mobile,
      required context}) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
    try {
      if (password == rePassword) {
        UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        //  addUserDetails(email, username, int.parse(mobile), password);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': username,
          'phoneNumber': mobile,
        });
        Navigator.pop(context);
        print(userCredential);
      } else {
        showError(context, "Password don't match!");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      print(e.credential);
      showError(context, e.code);
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      print(e.message);
      showError(context, e.code);
      Navigator.pop(context);
    }
  }

  Future<void> addUserDetails(
      String email, String username, int mobile, String password) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'usename': username,
      'mobile': mobile,
      'password': password,
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
