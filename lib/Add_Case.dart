import 'package:flutter/material.dart';
import 'different_fab_in_tabbar_task-6.dart';


class AddCase extends StatefulWidget{
  @override
  _AddCase createState() => _AddCase();
}

class _AddCase extends State<AddCase> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Scaffold(
          appBar: AppBar(

              title: Text('Nuevo caso',
                  style: TextStyle(
                      color: Colors.black87
                  ) ),
            backgroundColor: Colors.pinkAccent,

          )

      ),
    );
  }
}

