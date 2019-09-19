import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

        child: Column(
          children: <Widget>[
            _List(),
            StreamBuilder<QuerySnapshot>(
              stream: _query,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data ){
                if (data.hasData){
                  return _List();
                }
                return Center(
                  child: CircularProgressIndicator(),
                );

              },
            )
          ],



        ),
      ),



    );

    }

    Widget _item(IconData icon, String nombre ){

    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent, ),
      title: Text(nombre,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
        ),),
      subtitle: Text('Razon de vista: Asistencia social'),
    );
    }




  Widget _List(){
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) =>  _item(FontAwesomeIcons.idCard, "Oliver Perez Gutierrez"),
        separatorBuilder: (BuildContext context, int index){
          return Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 8.0,

          );
        },

      ),
    );

  }
}
