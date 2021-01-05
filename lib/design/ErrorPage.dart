import 'package:flutter/material.dart';
class ErrorPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return LoginPageWidget();
  }
}


class LoginPageWidget extends StatefulWidget{
  @override
  LoginPageState createState()=>LoginPageState();
}

class LoginPageState extends State<LoginPageWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Text("This is Error Page"),
      ),
    );
  }
}
