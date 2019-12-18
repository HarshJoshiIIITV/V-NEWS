import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsapp/dashboard.dart';
import 'package:queries/collections.dart';
import 'teamdata.dart';

class TrendScreen extends StatelessWidget {
  static const id = "trendscrren";
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Trending'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('news').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            var map = new Map();
            for (var d in data) {
              List<String>list=new List();
              if(d.data['show']){
                list.add(d.data['title']);
                list.add(d.data['date']);
                list.add(d.data['time']);
                map[d.data['likes']]=list;  
              }
            }
            var sortedMap = Map.fromEntries(
            map.entries.toList()..sort((e1, e2) => e2.key.compareTo(e1.key)));
            List<Widget> teams = List();
            var index = 0;
            for(var s in sortedMap.keys){
              if(index==5)
                break;
              index++;
              teams.add(
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Text(
                          map[s][0] +
                          "     "+map[s][1],
                          style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),
                        ),
                        Text(
                          map[s][2],
                          style: TextStyle(fontSize: 15.0,color:Colors.indigo,fontWeight:FontWeight.bold ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamScreen(
                            name: map[s][0],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
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
