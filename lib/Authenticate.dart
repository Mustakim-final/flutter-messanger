import 'package:chat_application/home_page.dart';
import 'package:chat_application/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends StatelessWidget {

  final FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser!=null){
      return HomeScreen();
    }else{
      return LoginScreen();
    }
  }
}

