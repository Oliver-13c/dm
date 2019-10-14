
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
            leading:  Icon(Icons.perm_identity, color: Colors.blueAccent,),
            title: Text('Nombre: '+ widget.snapshot.data['Name'] + " " +
                widget.snapshot.data['LastName'] +" " + widget.snapshot.data['SecondLastName']
            ),

          ),


          ListTile(

            leading:  Icon(Icons.calendar_today, color: Colors.blueAccent,),
            title: Text('Fecha de Nacimiento: '  +
            widget.snapshot.data['BirtDateDay'] +"/"+
                widget.snapshot.data['BirtDateMonth'] +"/"+
                widget.snapshot.data['BirtDateYear']
            ),

          ),
          ListTile(
            leading:  Icon(Icons.person, color: Colors.blueAccent,),
            title: Text('Genero: '+ widget.snapshot.data['Gender']),

          ),

          ListTile(
            leading:  Icon(Icons.contact_phone, color: Colors.blueAccent,),
            title: Text('Telefono:  ' + widget.snapshot.data['Phone'] ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Direccion', ),
          ),
          ListTile(
            leading:  Icon(Icons.map, color: Colors.blueAccent,),
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
