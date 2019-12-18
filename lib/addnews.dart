import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/dashboard.dart';

class IssueScreen extends StatelessWidget {
  static const id = "issuescrren";
  String sport;
  String _name;
  String _date;
  String _time;
  String _text;
  final _firestore = Firestore.instance;

  IssueScreen({this.sport});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Add News'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: sport,hintStyle: TextStyle(color: Colors.black),),
            enabled: false,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'News Title',hintStyle: TextStyle(color: Colors.blueGrey[600]),),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              _name = val;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Date',hintStyle: TextStyle(color: Colors.blueGrey[600]),),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              _date = val;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Time',hintStyle: TextStyle(color: Colors.blueGrey[600]),),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              _time = val;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Text',hintStyle: TextStyle(color: Colors.blueGrey[600]),),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              _text = val;
            },
          ),
          
          
          RaisedButton(
            child: Text('Add News',style:TextStyle(fontWeight:FontWeight.bold ) ,),
            color: Colors.indigo,
            textColor: Colors.white,
            onPressed: () async {
              final check = await _firestore
                  .collection('news')
                  .where('title', isEqualTo: _name)
                  .where('date', isEqualTo: _date)
                  .where('time', isEqualTo: _time)
                  .where('text', isEqualTo: _text)
                  .getDocuments();
              if (check.documents.isEmpty) {
                final data = await _firestore.collection('news').add(
                  {
                    'title': _name,
                    'text':_text,
                    'date': _date,
                    'time': _time,
                    'likes': 0,
                    'show':true,
                    'type':sport,
                  },
                );
              }

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
