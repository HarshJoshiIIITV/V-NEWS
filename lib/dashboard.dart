import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/add_admin.dart';
import 'package:newsapp/newstype.dart';
import 'package:newsapp/newstype_all.dart';
import 'removenews.dart';
import 'trendnews.dart';

class Dashboard extends StatefulWidget {
  static const id = 'dashboard';
  final FirebaseUser user;
  Dashboard({Key key, @required this.user}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              child: Text('Add News',style:TextStyle(fontWeight:FontWeight.bold) ,),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, ItemScreen.id);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              child: Text('Add Admin',style:TextStyle(fontWeight:FontWeight.bold) ,),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AdminScreen.id);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              child: Text('Delete News',style:TextStyle(fontWeight:FontWeight.bold) ,),
              color: Colors.indigo,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, RemoveScreen.id);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('News',style:TextStyle(fontWeight:FontWeight.bold) ,),
              onPressed: () {
                Navigator.pushNamed(context, NewsScreen.id);
              },
            ),
             SizedBox(
              height: 15.0,
            ),
            
            RaisedButton(
              padding:EdgeInsets.all(13.0) ,
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Trending News',style:TextStyle(fontWeight:FontWeight.bold) ,),
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
