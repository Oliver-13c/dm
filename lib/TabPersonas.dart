import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'ListPeaple.dart';

class TabPeople extends StatefulWidget {
  @override
  _TabPeopleState createState() => _TabPeopleState();
}

class _TabPeopleState extends State<TabPeople> {
//  Stream<QuerySnapshot> _query;
//
//
//
//  @override
//  void initState(){
//    super.initState();
//    _query  = Firestore.instance
//        .collection('Visitantes')
//        .snapshots();
//    print(_query);
//
//  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: ListDisplay(),

        ),

        );





    }


}
