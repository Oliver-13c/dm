

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'PeopleDatails.dart';
import 'Services/PeopleFilter.dart';

class ListDisplay extends StatefulWidget {




  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  var R1 = 'Apoyo personas discapacitadas';
  var R2 = 'Apoyo tercera endad';
  var R3 = 'Asesoria Legal';
  var R4 = 'Asistencia Social';
  var R5 = 'Despensas';
  var R6 = 'Terapia psicológica';
  var R7 = 'Violencia Familiar';
  var R8 = 'Otro';
  var R9 ="Todos";
  var CurrentItemSelected = 'Apoyo personas discapacitadas';

  StreamSubscription<QuerySnapshot>subscription;
  List<DocumentSnapshot>snapshot;
  CollectionReference collectionReference=Firestore.instance.collection('Visitantes');
  var Lengt=1;
  var ColotCH;

  void initState(){

    subscription=collectionReference.snapshots().listen((datasnapshot){
      setState(() {

        snapshot= datasnapshot.documents;
        Lengt = snapshot.length ;
        print(snapshot);
        snapshot.where((doc) =>doc['Reason']==CurrentItemSelected);

      });
    });

    super.initState();

  }

  passData(DocumentSnapshot snap) async {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context)=> PepleDetails(snapshot: snap,
        )));
  }
  
  PassFilter(String CurrentItemSelected){
    Navigator.of(context).push(new MaterialPageRoute
      (
        builder: (context)=> PeopleFilter( CurrentItemSelected)
    ));
  }


  @override
  Widget build(BuildContext context) {

    while(snapshot.length < 0){
      return Center(
            child: CircularProgressIndicator(),
          );
    }
    return Column(
      children: <Widget>[
         DropdownButton<String>(
          items: [
          DropdownMenuItem<String>(
           value: R1,
            child: Text (R1, style: TextStyle(
              color: Color(0xFF43A047)
            ),
          ),


          ),
          DropdownMenuItem<String> (
            value: R2,
            child: Text (
          R2,style: TextStyle(
                color: Color(0xFF6D4C41)
            ),
          ),
          ),

          DropdownMenuItem<String> (
            value: R3,
              child: Text (R3,style: TextStyle(
                  color: Color(0x8A000000)
              ),
          ),
          ),
          DropdownMenuItem<String> (
            value: R4,
            child: Text (
            R4,style: TextStyle(
                color: Color(0xFFFFEA00)
            ),
          ),
          ),

          DropdownMenuItem<String> (
            value: R5,
              child: Text (
          R5,style: TextStyle(
                  color: Color(0xFF5E35B1)
              ),
          ),
          ),
          DropdownMenuItem<String> (
            value: R6,
              child: Text (
          R6, style: TextStyle(
                  color: Color(0xFFFF8A80)
              ),
          ),
          ),

          DropdownMenuItem<String> (
            value: R7,
              child: Text (
          R7, style: TextStyle(
                  color: Color(0xFFFFD180)
              ),
          ),
          ),
          DropdownMenuItem<String> (
            value: R8,

            child: Text (
          R8, style: TextStyle(
                color: Color(0xFF1976D2)
            ),
          ),
          ),
            DropdownMenuItem<String> (
              value: R9,

              child: Text (
                R9,
              ),
            ),
          ],//DropdownButton
          onChanged: (value) {


            CurrentItemSelected = value;
            PassFilter(value);
            


            setState(() {
            });


                  print("value: $value");
//                            Firestore.instance
//                                .collection('Visitantes')
//                                .where('Estado', isEqualTo: 'NL')
//                                .snapshots()
//                                .listen((data) =>
//                                data.documents.forEach((doc) => print(doc.data)));
//                            print('hola');

          },
          hint: Text (
            CurrentItemSelected,
            style: TextStyle (
              color: Colors.black87,
            ),
          ),
        ),
          _List(),
                  ],

    );
  }


  Widget _item(IconData icon, String Name, String LastName, String Reason, SecondLastName, index, ColorOption ) {

    switch(Reason){
      case 'Apoyo personas discapacitadas':{
        ColotCH = 0xFF43A047
        ;
      }
      break;
      case 'Apoyo tercera endad':{
        ColotCH = 0xFF6D4C41;
      }
      break;
      case 'Otro':{
        ColotCH = 0xFF1976D2;
      }
      break;
      case  'Asesoria Legal':{
        ColotCH = 0x8A000000;
      }
      break;
      case  'Asistencia Social':{
        ColotCH = 0xFFFFEA00;
      }
      break;
      case  'Despensas':{
        ColotCH = 0xFF5E35B1;
      }
      break;
      case  'Terapia psicológica':{
        ColotCH = 0xFFFF8A80;
      }
      break;
      case  'Violencia Familiar':{
        ColotCH = 0xFFFFD180;
      }
      break;

    }

    return ListTile(
      leading: Icon(icon, color: Color(ColotCH), ),
     onTap: (){
        passData(snapshot[index]);
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
//          return Center(
//            child: CircularProgressIndicator(),
//
        return _item(FontAwesomeIcons.idCard,  (snapshot[index].data["Name"]),
            (snapshot[index].data["LastName"]), (snapshot[index].data["Reason"]),
            (snapshot[index].data["SecondLastName"]), index,
            (snapshot[index].data["ColorOption"])
        );
        },
 
        separatorBuilder: (BuildContext context, int index){
          return Container(
            //color: Colors.blueAccent.withOpacity(0.15),
            height: 8.0,
          );
        },

      ),
    );

  }
}


