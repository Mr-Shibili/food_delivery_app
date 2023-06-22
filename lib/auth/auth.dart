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
        return Center(child: CircularProgressIndicator());
      },
    );
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        print('user name error');
        wrongEmail(context);
      } else if (e.code == 'wrong-password') {
        wrongPass(context);
        print('password error');
      }
    }

    print('Worked');
  }

  void wrongEmail(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Error Email',
            style: TextStyle(color: kredcolor),
          ),
        );
      },
    );
  }

  void wrongPass(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Error Password',
            style: TextStyle(color: kredcolor),
          ),
        );
      },
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
