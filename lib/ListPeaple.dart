

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ListDisplay extends StatefulWidget {
  final List<DocumentSnapshot> documents;
   final Map<String, dynamic> profile;


   ListDisplay({Key key, this.documents, this.profile,})
      :


      super(key: key);



  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {



  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _List()

      ],
    );
  }
  Widget _item(IconData icon, String nombre ){

    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent, ),
     onTap: (){
       Navigator.of(context).pushNamed('/Details');
     },
      title: Text(nombre,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),),
      subtitle: Text('Razon de vista: Asistencia social'),
    );
  }




  Widget _List(){
//    print(widget.documents);
    return Expanded(
      child: ListView.separated(
        itemCount:  5,
        itemBuilder: (BuildContext context, int index) =>
            _item(FontAwesomeIcons.idCard, "Oliver Perez Gutierrez"),

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

class PepleDetails extends StatefulWidget {
  @override
  _PepleDetailsState createState() => _PepleDetailsState();
}

class _PepleDetailsState extends State<PepleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row (
          children: <Widget>[
            Icon(Icons.spa),
            SizedBox(width: 8.0),
            Text("Detalles"),


          ],
        ),
          backgroundColor: Colors.pinkAccent,

      ),
      body:

        ListView(


          children: <Widget>[
          ListTile(
            leading:  Icon(Icons.perm_identity, color: Colors.blueAccent,),
            title: Text('Nombre: Oliver Perez Gutierrez'),

          ),


          ListTile(
              leading:  Icon(Icons.calendar_today, color: Colors.blueAccent,),
              title: Text('Fecha de Nacimiento: 26/10/1994 '),

          ),
            ListTile(
              leading:  Icon(Icons.person, color: Colors.blueAccent,),
              title: Text('Genero: Masculino'),

            ),

          ListTile(
              leading:  Icon(Icons.contact_phone, color: Colors.blueAccent,),
              title: Text('Telefono: 8110787253 '),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Direccion', ),
            ),
            ListTile(
              leading:  Icon(Icons.map, color: Colors.blueAccent,),
              title: Text('Calle: Tecnologico Numero: 139 Colonia: '
                  'Los Pilares                Municipio: Salinas Victoria   '
                  '                    Estado: Nuevo Leon'),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Comentarios"),
            )




          ],
      ),

      );
  }
}


