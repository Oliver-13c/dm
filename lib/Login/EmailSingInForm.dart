import 'package:provider/provider.dart';


import 'package:dm/Services/auth.dart';
import 'package:flutter/material.dart';

enum EmailSignInFormType { signIn, register }

class EmailSingInForm extends StatefulWidget {
 EmailSingInForm({@required this.auth});
  final AuthBase auth;

  @override
  _EmailSingInFormState createState() => _EmailSingInFormState();
}

class _EmailSingInFormState extends State<EmailSingInForm> {



  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    try {

      print(_email);
      print(_password);
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
        Navigator.of(context).pushNamed('/DiffFABinTabbar');
      } else {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
     // Navigator.of(context).pushNamed('/DiffFABinTabbar');
    } catch (e) {
     //
      print(e.toString());

     // Navigator.of(context).pushNamed('/DiffFABinTabbar');
    }
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn ?
      EmailSignInFormType.register : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }


  List<Widget> _buildChildren(){
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Iniciar sesión'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'aun no tiene cuenta? Registrarse'
        : 'ya tiene cuenta? Iniciar sesión';
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Correo Electronico',
          hintText: "tuCorreo@gmail.com"

        ),
      ),
      SizedBox(height: 8.00,),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            hintText: "*****"

        ),
        obscureText: true,
      ),
      SizedBox(height: 8.00,),
      RaisedButton(

        child: Text(
                primaryText,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            )),
        onPressed:()  {
      Navigator.of(context).pushNamed('/DiffFABinTabbar');
      },
      ),
      SizedBox(height: 8.0),
      FlatButton(
        child: Text(secondaryText),
        onPressed: (){
          Navigator.of(context).pushNamed('/DiffFABinTabbar');
        }
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren()
      ),
    );


  }
}
