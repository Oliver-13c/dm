import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dm/DropDownButton.dart';
import 'Add_Person.dart';

class AddPersonForm extends StatefulWidget {
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {

  final _formKey = GlobalKey<FormState>();
  final _FirstName = TextEditingController();
  final _Lastname = TextEditingController();
  final _SecondLastName = TextEditingController();
  final  _Phone = TextEditingController();
  final _Street = TextEditingController();
  final _StreetNumber = TextEditingController();
  final _Colonia = TextEditingController();
  final _Municipio = TextEditingController();
  final _Estado = TextEditingController();
  final _BirthDate = TextEditingController();






  @override
  Widget build(BuildContext context) {
    return Container(

      child: Form(
        key: _formKey,
        child: SingleChildScrollView(


          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Nombre'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el nombre';

                    }
                    return null;
                  },
                  controller: _FirstName,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Apellido Paterno'

                  ),


                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el apellido paterno';

                    }

                    return null;
                  },
                  controller: _Lastname,

                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Apellido Materno'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el apellido materno';

                    }
                    return null;
                  },
                  controller: _SecondLastName,

                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Numero de telefono'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el numero de telefono';

                    }
                    return null;
                  },
                  controller: _Phone,


                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Fecha de Nacimiento'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir la decha de nacimiento';

                    }
                    return null;
                  },
                  controller: _BirthDate,


                ),
                TextU(),

                Container(

                  child: Container(
                    child: TextFormField(
                      decoration: InputDecoration(

                          labelText: 'Calle',

                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return 'Favor de introducir la calle';

                        }

                        return null;
                      },
                      controller: _Street,


                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Numero'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el numero de casa';

                    }
                    return null;
                  },
                  controller: _StreetNumber,


                ),

                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Colonia'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el nombre de colonia';

                    }
                    return null;
                  },
                  controller: _Colonia,


                ),

                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Municipio'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el nombre del municipio';

                    }
                    return null;
                  },
                  controller: _Municipio,


                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Estado de la republica'
                  ),
                  validator: (value){
                    if (value.isEmpty){
                      return 'Favor de introducir el numero de telefono';

                    }
                    return null;
                  },
                  controller: _Estado,


                ),
                TestButton(),
                DropDownMenu(),




                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.

                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Firestore.instance
                        .collection('Visitantes')
                        .document()
                        .setData({
                          'Name': _FirstName.text,
                          'Phone': _Phone.text,
                          'LastName': _Lastname.text,
                          'SecondLastName': _SecondLastName.text,
                          'Colonia': _Colonia.text,
                          'Municipio': _Municipio.text,
                          'Estado': _Estado.text,
                          'BirthDate': _BirthDate.text,




                        });


                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Procesando su informacion')));
                        Navigator.pop(context);

                      }

                    },
                    child: Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}


class TextU extends StatefulWidget {
  @override
  _TextUState createState() => _TextUState();
}


class _TextUState extends State<TextU> {
  @override
  Widget build(BuildContext context) {
    Text('Direccion');

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Text('Direccion',
          style: TextStyle(fontWeight: FontWeight.bold),

        ),
      ),
    );
  }
}

