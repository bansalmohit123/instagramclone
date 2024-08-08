import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
class AuthMethods{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file
  }) async{
String res="some error occured";
try {
  if(email.isNotEmpty||password.isNotEmpty||username.isNotEmpty||bio.isNotEmpty||file!=null){
    //registrer user
   UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
   print(cred.user);
  String photoUrl = await StorageMethods().uploadImagetoStorage('profilePics', file, false);
   // add user to database
   _firestore.collection('users').doc(cred.user!.uid).set({
    'username':username,
    'uid':cred.user!.uid,
    'email':email,
    'bio':bio,
    'followers':[],
    'following':[],
    'photoUrl':photoUrl

   });
   res="success";
  }
} catch (e) {
  res=e.toString();
}
return res;
  }
}
