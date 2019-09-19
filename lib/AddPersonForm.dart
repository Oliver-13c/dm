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
  var  _currentItemSelected = 'Razón de su visita';
  var R1 = 'Apoyo personas discapacitadas';
  var R2 = 'Apoyo tercera endad';
  var R3 = 'Asesoria Legal';
  var R4 = 'Asistencia Social';
  var R5 = 'Despensas';
  var R6 = 'Terapia psicológica';
  var R7 = 'Violencia Familiar';
  var R8 = 'Otro';
  //varibles for the date picker
  final format = DateFormat("yyyy-MM-dd");
  var _BirtDateDay;
  var _BirtDateMonth;
  var _BirtDateYear;
  // variables for gender drop down button
  final G1 = 'Hombre';
  final G2 = "Mujer";
  final G3 ='Otro';
  var _currentItemSelectedGender =  'Genero';
  var _Id=0;



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

              DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  value: G1,
                  child: Text(
                    G1,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: G2,
                  child: Text(
                    G2,
                  ),
                ),

                DropdownMenuItem<String>(
                  value: G3,
                  child: Text(
                    G3,
                  ),
                ),

              ],
              onChanged: (value) {
                _currentItemSelectedGender = value;

                setState(() {
                });


//                print("value: $value");
//                print(_currentItemSelectedGender);
              },
              hint: Text(
                _currentItemSelectedGender,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            ),



            Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Fecha de nacimiento', textAlign: TextAlign.left,),
                    DateTimeField(
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100),

                        );

                      },
                      onChanged: (date) {
                        print("Selected: ${date.month}");
                        _BirtDateDay = date.year;
                        _BirtDateMonth = date.month;
                        _BirtDateYear = date.year;
                      },
                    ),



                  ],

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
               DropdownButton<String>(
                      items: [
                      DropdownMenuItem<String>(
                        value: R1,
                        child: Text (
                          R1,
                        ),
                      ),
                        DropdownMenuItem<String> (
                          value: R2,
                          child: Text (
                            R2,
                          ),
                        ),

                        DropdownMenuItem<String> (
                          value: R3,
                          child: Text (
                            R3,
                          ),
                        ),
                        DropdownMenuItem<String> (
                          value: R4,
                          child: Text (
                            R4,
                          ),
                        ),

                        DropdownMenuItem<String> (
                          value: R5,
                          child: Text (
                            R5,
                          ),
                        ),
                        DropdownMenuItem<String> (
                          value: R6,
                          child: Text (
                            R6,
                          ),
                        ),

                        DropdownMenuItem<String> (
                          value: R7,
                          child: Text (
                            R7,
                          ),
                        ),
                        DropdownMenuItem<String> (
                          value: R8,
                          child: Text (
                            R8,
                          ),
                        ),
                        ],
                        onChanged: (value ) {
                            _currentItemSelected = value;

                  setState(() {
                  });


//                  print("value: $value");
//                            Firestore.instance
//                                .collection('Visitantes')
//                                .where('Estado', isEqualTo: 'NL')
//                                .snapshots()
//                                .listen((data) =>
//                                data.documents.forEach((doc) => print(doc.data)));
//                            print('hola');

                  },
                    hint: Text (
                      _currentItemSelected,
                      style: TextStyle (
                        color: Colors.black87,
                      ),
                    ),
                  ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.

                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.

                        _Id = _Id +1;

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
                          "Reason": _currentItemSelected,
                          "Date": DateTime.now(),
                          "BirtDateDay": _BirtDateDay,
                          "BirtDateMonth": _BirtDateMonth,
                          "BirtDateYear": _BirtDateYear,
                          'Gender': _currentItemSelectedGender,
                          'Id': _Id,

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

