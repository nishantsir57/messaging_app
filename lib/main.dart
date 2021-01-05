import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messaging_app/design/SignUpPage.dart';

import 'design/ErrorPage.dart';
import 'design/login.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // runApp(
  //   MaterialApp(
  //     home: LoginPage(),
  //   )
  // );

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Future<FirebaseApp> _initialization() async
  {
    FirebaseOptions options=const FirebaseOptions(
        apiKey: "AIzaSyB-h2TbGACPUcGNDVXG9ZAoWx7bSiV-NWI",
        authDomain: "messaging-app-18d54.firebaseapp.com",
        projectId: "messaging-app-18d54",
        storageBucket: "messaging-app-18d54.appspot.com",
        messagingSenderId: "839177047433",
        appId: "1:839177047433:web:3541b9a74066ce85a5a558",
        measurementId: "G-WQT3E17L66"
    );
    String name="messaging-app";
    return await Firebase.initializeApp(name: name, options: options);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Text(snapshot.error.toString())
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: SignUpPage(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }

}


