import 'package:dm/Services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Email_Singin_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({@required this.auth});
  final AuthBase auth;

//  void _signInWithEmail(BuildContext context) {
//    Navigator.of(context).push(
//      MaterialPageRoute<void>(
//        fullscreenDialog: true,
//        builder: (context) => EmailSingInPage(auth: auth, ),
//      ),
//    );
//  }


  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sesión '),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          color: Colors.grey[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                    'assets/images/web_hi_res_512.png',
                  colorBlendMode: BlendMode.colorBurn,

                     fit: BoxFit.fitWidth,

                ),
              ),
//

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: RaisedButton(

                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    )),
                    color: Colors.white,
                   onPressed: (){

                      Navigator.of(context).pushNamed('/EmailSingInPage');

                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
