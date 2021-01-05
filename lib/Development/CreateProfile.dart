import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfile
{
  Future<String> createProfile(String name, String email, String password) async
  {
    FirebaseFirestore firestore=FirebaseFirestore.instance;
    HashMap<String, Object> map=new HashMap();
    map['name']=name;
    map['email']=email;
    map['password']=password;
    try{
      firestore.collection("users").doc(email).setData(map);
    }catch(e)
    {
      return e;
    }
    return "success";
  }
}