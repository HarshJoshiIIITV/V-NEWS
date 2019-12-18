import 'package:flutter/material.dart';
import 'package:newsapp/newstype_all.dart';
import 'newstype_all.dart';
import 'trendnews.dart';

class Dashboard1 extends StatefulWidget {
  static const id = "userScreen";
  @override
  _Dashboard1State createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             SizedBox(
              height: 70.0,
            ),
            RaisedButton(
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('News',style:TextStyle(fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.pushNamed(context, NewsScreen.id);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Trending News',style:TextStyle(fontWeight: FontWeight.bold),),
              onPressed: () {
                 Navigator.pushNamed(context, TrendScreen.id);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('Dashboard',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white),),  
              color:Colors.indigo,  
          ),
          ),
          Expanded(
            child: RaisedButton(
              color:Colors.indigo ,
              child: Text('LogOut',style: TextStyle(fontWeight:FontWeight.bold,color:Colors.white),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
