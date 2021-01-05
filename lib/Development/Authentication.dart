import 'package:firebase_auth/firebase_auth.dart';

class Authentication
{
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  Future<String> signup(String email, String password) async
  {
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e)
    {
       return e.toString();
    }
    return "success";
  }
}