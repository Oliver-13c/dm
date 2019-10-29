import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../PeopleDatails.dart';





class PeopleFilter extends StatefulWidget {
  final String CurrentReason;
  PeopleFilter(this.CurrentReason, {Key key}): super(key: key);


  @override
  _PeopleFilterState createState() => _PeopleFilterState();
}

class _PeopleFilterState extends State<PeopleFilter> {
  Stream<QuerySnapshot> _query;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print('instate'+widget.CurrentReason);
    _query = Firestore.instance
        .collection('Visitantes')
        .where("Reason", isEqualTo: widget.CurrentReason)
        .snapshots();
  }



  @override
  Widget build(BuildContext context) {

    print(widget.CurrentReason);
    return Scaffold(
      appBar: AppBar(
        title: Text ( widget.CurrentReason ),


      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: Column(
        children: <Widget>[

          StreamBuilder<QuerySnapshot>(
            stream: _query,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
              if (data.hasError) {
                return FilterWidget(
                    documents: data.data.documents
                );
              }

              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: new CircularProgressIndicator(

                            ),
                          ),
                        ),
                        Center(child: Text("Se estan cargando los datos")),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}


class FilterWidget extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  FilterWidget({Key key, this.documents}):super(key: key);


  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  var ColotCH;
  passData(DocumentSnapshot snap) async {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context)=> PepleDetails(snapshot: snap,
        )));
  }
  @override
  Widget build(BuildContext context) {
    print('antes del widget.documents');
    print(widget.documents[0].data['Name']);


    return Container(
      child: _List(),

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
        passData(widget.documents[index]);
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
        itemCount: widget.documents.length,
        itemBuilder: (BuildContext context, index) {
//          return Center(
//            child: CircularProgressIndicator(),
//
          return _item(FontAwesomeIcons.idCard,  (widget.documents[index].data["Name"]),
              (widget.documents[index].data["LastName"]), (widget.documents[index].data["Reason"]),
              (widget.documents[index].data["SecondLastName"]), index,
              (widget.documents[index].data["ColorOption"])
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
