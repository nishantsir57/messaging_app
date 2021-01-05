import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfile
{
  Future<void> createProfile(String name, String email) async
  {
    CollectionReference users=FirebaseFirestore.instance.collection("users");
    return users.add(
      {
        'name' :name,
        'email' : email
      }
    ).then((value) => "success")
        .catchError((error) => "Some Error Occured, Please Try Again");
  }
}