
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  List<String> _RozonVisita = ['Apoyo', 'tro'];

  var _currentItemSelected = "Razón de su visitaS";




  @override
  Widget build(BuildContext context) {



    return DropdownButton<String>(
      items: _RozonVisita.map((String dropDownStringItem){
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
            child: Text(dropDownStringItem),
        );
      }) .toList(),
      onChanged: (String newValueSelected){
        setState(() {
          this._currentItemSelected = newValueSelected;
        });
      },

      value: _currentItemSelected,

        );


  }
}


class TestButton extends StatefulWidget {
  @override
  _TestButtonState createState() => _TestButtonState();
}

class _TestButtonState extends State<TestButton> {
  List _RozonVisita = ['Apoyo personas discapacitadas', 'Apoyo tercera endad',
    'Asesoria Legal', 'Asistencia Social', 'Despensas', 'Terapia psicológica',
    'Violencia Familiar', 'tro'];

  List<String>  _currencies = ['ApoyoPersonasU+00A0Discapacitadas', 'Dollars', 'Pounds', 'Others'];
  var _currentItemSelected = 'Dollars';
  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(

      items: _currencies.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),

      onChanged: (String newValueSelected) {
        // Your code to execute, when a menu item is selected from drop down
        _onDropDownItemSelected(newValueSelected);
      },

      value: _currentItemSelected,

    );
  }
  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}


