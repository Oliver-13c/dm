
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PepleDetails extends StatefulWidget {

  DocumentSnapshot snapshot;
  PepleDetails({this.snapshot,
  }


  );



  @override
  _PepleDetailsState createState() => _PepleDetailsState();
}





class _PepleDetailsState extends State<PepleDetails> {

  @override
  Widget build(BuildContext context) {
    var ColotCH;



    switch(widget.snapshot.data['Reason']){
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
    return Scaffold(
      appBar: AppBar(

        title: Text('Detalles'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => debugPrint('edit'),
          )
        ],

      ),
      body:

      ListView(


        children: <Widget>[
          ListTile(
            leading:  Icon(Icons.perm_identity, color: Color(ColotCH),),
            title: Text('Nombre: '+ widget.snapshot.data['Name'] + " " +
                widget.snapshot.data['LastName'] +" " + widget.snapshot.data['SecondLastName']
            ),

          ),


          ListTile(

            leading:  Icon(Icons.calendar_today, color: Color(ColotCH),),
            title: Text('Fecha de Nacimiento: '  +
            widget.snapshot.data['BirtDateDay'] +"/"+
                widget.snapshot.data['BirtDateMonth'] +"/"+
                widget.snapshot.data['BirtDateYear']
            ),

          ),
          ListTile(
            leading:  Icon(Icons.person, color: Color(ColotCH),),
            title: Text('Genero: '+ widget.snapshot.data['Gender']),

          ),

          ListTile(
            leading:  Icon(Icons.contact_phone, color: Color(ColotCH),),
            title: Text('Telefono:  ' + widget.snapshot.data['Phone'] ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Direccion', ),
          ),
          ListTile(
            leading:  Icon(Icons.map, color: Color(ColotCH),),
            title: Text('Calle: '+ widget.snapshot.data['StreetName'] +' Numero: '
                + widget.snapshot.data['StreetNumber'] +' Colonia: '
                + widget.snapshot.data['Colonia'] +
                '                              Municipio: ' + widget.snapshot.data['Municipio'] +'    '
                '                    Estado: ' + widget.snapshot.data['Estado'] +' '),

          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Seguimiento"),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur vitae consectetur sunt culpa deleniti necessitatibus commodi dignissimos, illum assumenda dolorum eligendi repellendus. Nulla fuga, ipsam similique repudiandae quod sit nam. "),
          ),




        ],



      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.comment),
      ),




    );
  }
}
