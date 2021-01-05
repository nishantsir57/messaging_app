import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetUsers extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CollectionReference users=FirebaseFirestore.instance.collection("users");
    return StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
      {
        if(snapshot.hasError)
          return Text("Some Error Occured");
        if(snapshot.connectionState == ConnectionState.waiting)
          return Text("Loading...");
        return new ListView(
          children: snapshot.data.documents.map(
              (DocumentSnapshot document){
                return new ListTile(
                 title: new Text(document.data()['email']),
                );
              }
          ).toList(),
        );
      },
    );
  }
}