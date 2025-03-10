import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'TabPersonas.dart';

class DiffFABinTabbar extends StatefulWidget {
  @override
  _DiffFABinTabbarState createState() => _DiffFABinTabbarState();
}

class _DiffFABinTabbarState extends State<DiffFABinTabbar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    super.initState();

      _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
      setState(() {});
    });



  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(Icons.spa),
            SizedBox(width: 8.0),
            Text("DM"),
          ],
        ),
        backgroundColor: Colors.pinkAccent,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: "Personas",

            ),
            Tab(
              text: "Casos",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TabPeople(),
          segundatab(),

        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/AddPerson');

        },
      )
          : FloatingActionButton(
        backgroundColor: Colors.red,
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed('/AddCase');
          },
            child: Icon(Icons.edit),

           ),
        onPressed: () {

        },
      ),
    );
  }
}



class segundatab extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(


    );
  }
}