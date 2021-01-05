import 'package:firebase_auth/firebase_auth.dart';

class Authentication
{
  Future<String> signup(String email, String password) async
  {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e1)
    {
      if(e1.code == 'weak-password')
        return 'weak-password';
      if(e1.code == 'email-already-in-use')
        return 'user-exist';
    }
    catch(e)
    {
      return e.toString();
    }
    return "success";
  }

  Future<String> signin(String email, String password) async
  {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
    }on FirebaseAuthException catch(e2)
    {
      if(e2.code == 'user-not-found')
        return 'not-found';
      if(e2.code == 'wrong-password')
        return 'wrong-password';
    }
    catch(e)
    {
      return e.toString();
    }
    return 'success';
  }
}