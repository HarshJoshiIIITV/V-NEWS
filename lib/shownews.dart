import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/dashboard.dart';
import 'teamdata.dart';

class ShowScreen extends StatelessWidget {
  static const id = "showscrren";
  String sport;
  String _name;
  String _date;
  String _time;
  String _text;
  final _firestore = Firestore.instance;

  ShowScreen({this.sport});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(sport),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('news').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> teams = List();
            for (var d in data) {
              if(d.data['show'] && (d.data['type']==sport)){
              teams.add(
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Text(
                          d.data['title'] +
                          "     "+d.data['date'],
                          style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),
                        ),
                        Text(
                          d.data['time'],
                          style: TextStyle(fontSize: 15.0,color:Colors.indigo,fontWeight:FontWeight.bold ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamScreen(
                            name: d.data['title'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: teams,
            );
          },
        ),
      ),
    );
    }
}
