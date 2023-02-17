

import 'package:chat_application/home_page.dart';
import 'package:chat_application/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<User?> createAccount(String name,String email,String password) async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  try{
    User? user=(await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
    if(user!=null){
      print("Account create successfull");

      await _firestore.collection("Users").doc(_auth.currentUser?.uid).set({
        "name":name,
        "email":email,
        "password":password,
        "status":"Unavalible",
      });
      return user;
    }else{
      print("Account creation failed");
      return user;
    }
  }catch(e){
    print(e);
    return null;
  }
}


Future<User?> logIn(String email,String password) async{
  FirebaseAuth _auth=FirebaseAuth.instance;
  try{
    User? user=(await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    if(user!=null){
      print("Login Successfull");
      return user;
    }else{
      print("Login Failed");
      return user;
    }
  }catch (e){
    print(e);
    return null;
  }
}


Future<User?> LogOut(BuildContext context) async{
  FirebaseAuth _auth=FirebaseAuth.instance;

  try{
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }catch (e){
    print("error");

  }
}
