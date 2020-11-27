import 'package:chat_curso/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  Firestore.instance.collection('mensagens').snapshots().listen((event) {
    event.documents.forEach((element) {
      print(element.data);
    });
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            iconTheme: IconThemeData(color: Colors.blue)),
        home: ChatScreen());
  }
}
