import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/shownews2.dart';

class RemoveScreen extends StatefulWidget {
  static const id = 'removescreen';
  @override
  _RemoveScreenState createState() => _RemoveScreenState();
}

class _RemoveScreenState extends State<RemoveScreen> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: Text('News Type'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('type').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> items = List();
            for (var d in data) {
              items.add(
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowScreen2(
                            sport: d.data['newstype'],
                          ),
                        ),
                      );
                    },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text(
                          d.data['newstype'],
                          style: TextStyle(fontWeight:FontWeight.bold,fontSize:20),
                        ),
                      ),
                       SizedBox(
                      height:60 ,
                    ),
                    ],
                  ),
                ),
              );
            }
            return Column(
              children: items,
            );
          },
        ),
      ),
    );
  }
}
