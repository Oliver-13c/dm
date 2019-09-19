import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ListPeaple.dart';

class TabPeople extends StatefulWidget {
  @override
  _TabPeopleState createState() => _TabPeopleState();
}

class _TabPeopleState extends State<TabPeople> {
  Stream<QuerySnapshot> _query;



  @override
  void initState(){
    super.initState();
    _query  = Firestore.instance
        .collection('Visitantes')
        .snapshots();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(

        child: StreamBuilder<QuerySnapshot>(
          stream: _query,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data){
            if (data.hasData){
              return ListDisplay(
                documents: data.data.documents,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );

          },
        )




        ),
      );




    }


}
