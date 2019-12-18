import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'user_screen.dart';       

class SignUpScreen extends StatefulWidget {
  static const id = 'signuppage';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _name;
  String _pass;
  String _email;
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Sign Up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: (val) {
              _name = val;
            },
            decoration: InputDecoration(hintText: 'Name',hintStyle: TextStyle(color: Colors.blueGrey[600]),),
          ),
          TextField(
            onChanged: (val) {
              _email = val;
            },
            decoration: InputDecoration(hintText: 'Email',hintStyle: TextStyle(color: Colors.blueGrey[600]),),
          ),
          TextField(
            onChanged: (val) {
              _pass = val;
            },
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(color: Colors.blueGrey[600]),),
          ),
          RaisedButton(
            child: Text('Sign Up',style:TextStyle(fontWeight:FontWeight.bold )),
            color: Colors.indigo,
            textColor: Colors.white,
            onPressed: () async {
              final checkAdmin = await _firestore
                  .collection('admin')
                  .where('email', isEqualTo: _email)
                  .getDocuments();
              if (checkAdmin.documents.isEmpty) {
                final checkUser = await _firestore
                    .collection('user')
                    .where('email', isEqualTo: _email)
                    .getDocuments();
                if (checkUser.documents.isEmpty) {
                  final data = await _firestore.collection('user').add(
                    {
                      'name': _name,
                      'password': _pass,
                      'email': _email,
                    },
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard1(),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
