import 'package:dm/Services/auth.dart';
import 'package:flutter/material.dart';

import 'EmailSingInForm.dart';

class EmailSingInPage extends StatelessWidget {
  EmailSingInPage({@required this.auth});
  final AuthBase auth;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.blue,

          title: Text('Iniciar sesion'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(child: EmailSingInForm(auth: auth,),
            ),
        ),
      ),
    );
  }
}
