import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/addnews.dart';

class ItemScreen extends StatefulWidget {
  static const id = 'screen';
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: Text('News Section'),
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
                          builder: (context) => IssueScreen(
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
                      height:60,
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
