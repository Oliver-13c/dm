

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'PeopleDatails.dart';

class ListDisplay extends StatefulWidget {




  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {

  StreamSubscription<QuerySnapshot>subscription;
  List<DocumentSnapshot>snapshot;
  CollectionReference collectionReference=Firestore.instance.collection('Visitantes');
  var Lengt=1;

  void initState(){

    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {

        snapshot=datasnapshot.documents;
        Lengt = snapshot.length ;

      });
    });

    super.initState();

  }

  passData(DocumentSnapshot snap){
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context)=> PepleDetails(snapshot: snap,)));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[


        _List()




      ],




    );
  }


  Widget _item(IconData icon, String Name, String LastName, String Reason, SecondLastName, index ){

    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent, ),
     onTap: (){
        passData(snapshot[index]);
       //Navigator.of(context).pushNamed('/Details');
     },
      title: Text("$Name $LastName $SecondLastName",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),),
      subtitle: Text('Razon de vista:  $Reason'),
    );
  }




  Widget _List(){
//    print(widget.documents);
    return Expanded(
      child: ListView.separated(
        itemCount: Lengt,
        itemBuilder: (BuildContext context, index) {
          if (snapshot[index].data.isNotEmpty ){

            return _item(FontAwesomeIcons.idCard,  (snapshot[index].data["Name"]),
                (snapshot[index].data["LastName"]), (snapshot[index].data["Reason"]),
                (snapshot[index].data["SecondLastName"]), index );

          }

          return Center(
            child: CircularProgressIndicator(),
          );


        },
 
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


