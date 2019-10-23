
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'PeopleDatails.dart';

class Comments extends StatefulWidget {
  final String SnapId;
  Comments(this.SnapId, {Key key}): super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    var Id = widget.SnapId;
     final Coment = TextEditingController();
    var Ke;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Seguimiento'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              debugPrint( Id );
              Firestore.instance
                  .collection('Visitantes/$Id/Comentarios')
                  .document()
                  .setData({
                "Date": DateTime.now(),
                "Seguimineto": Coment.text,

              }

              );
              Navigator.pop(context);


            },
          )
        ],



      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                hintText: 'Comentarios, resolucion',
              ),
            maxLines: 99,
            controller: Coment,

          ),
        ),
      ),

    );
  }
  

}
