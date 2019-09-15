
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {



  var _currentItemSelected = 'Razón de su visita';
  var R1 = 'Apoyo personas discapacitadas';
  var R2 = 'Apoyo tercera endad';
  var R3 = 'Asesoria Legal';
  var R4 = 'Asistencia Social';
  var R5 = 'Despensas';
  var R6 = 'Terapia psicológica';
  var R7 = 'Violencia Familiar';
  var R8 = 'Otro';

  @override
  Widget build(BuildContext context) {


    DropdownButton _hintDown() => DropdownButton<String>(
      items: [
        DropdownMenuItem<String>(
          value: R1,
          child: Text(
            R1,
          ),
        ),
        DropdownMenuItem<String>(
          value: R2,
          child: Text(
            R2,
          ),
        ),

        DropdownMenuItem<String>(
          value: R3,
          child: Text(
            R3,
          ),
        ),
        DropdownMenuItem<String>(
          value: R4,
          child: Text(
            R4,
          ),
        ),

        DropdownMenuItem<String>(
          value: R5,
          child: Text(
            R5,
          ),
        ),
        DropdownMenuItem<String>(
          value: R6,
          child: Text(
            R6,
          ),
        ),

        DropdownMenuItem<String>(
          value: R7,
          child: Text(
            R7,
          ),
        ),
        DropdownMenuItem<String>(
          value: R8,
          child: Text(
            R8,
          ),
        ),
      ],
      onChanged: (value) {
        _currentItemSelected = value;

        setState(() {
        });


        print("value: $value");
        print(_currentItemSelected);
      },
      hint: Text(
        _currentItemSelected,
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
    );


    return Container(
      child: Column(
        children: <Widget>[
          _hintDown()
        ],
      ),


    );
  }
}

