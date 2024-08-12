import 'dart:typed_data';
import 'package:instagram_clone/models/user.dart' as model;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
class AuthMethods{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await  _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap) ;
  }
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
   model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );
   _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
   res="success";
  }
} 
catch (e) {
  res=e.toString();
}
return res;
  }


  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
