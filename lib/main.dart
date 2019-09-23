import 'package:dm/Add_Case.dart';
import 'package:dm/Add_Person.dart';
import 'package:dm/ListPeaple.dart';
import 'package:flutter/material.dart';
import 'Login/Login_page.dart';
import 'different_fab_in_tabbar_task-6.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes:{
        '/': (BuildContext context) => LoginPage(),
        '/DiffFABinTabbar':(BuildContext context) => DiffFABinTabbar(),
        '/AddPerson': (BuildContext context) => AddPerson(),
        '/AddCase': (BuildContext context) =>  AddCase(),
        '/Details': (BuildContext context) => PepleDetails(),
      }
    );
  }
}

