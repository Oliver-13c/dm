import 'package:dm/AddPersonForm.dart';
import 'package:flutter/material.dart';
import 'different_fab_in_tabbar_task-6.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPerson extends StatefulWidget{
  @override
  _AddPerson createState() => _AddPerson();
  }

class _AddPerson extends State<AddPerson> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Registro',
            style: TextStyle(
              color: Colors.black87
            )  ),
                backgroundColor: Colors.pinkAccent,
          ),
              body: AddPersonForm(),

      ),
    );
  }
}







