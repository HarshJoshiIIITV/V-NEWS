import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/loginpage.dart';
import 'package:newsapp/shownews.dart';

import 'package:newsapp/signup_page.dart';
import 'package:newsapp/teamdata.dart';
import 'package:newsapp/trendnews.dart';
import 'package:newsapp/user_screen.dart';
import 'package:newsapp/welcomepage.dart';
import 'package:newsapp/dashboard.dart';
import 'add_admin.dart';
import 'removenews.dart';
import 'newstype.dart';
import 'addnews.dart';
import 'newstype_all.dart';
import 'shownews2.dart';

void main() => runApp(
      MaterialApp(
        home: WelcomeScreen(),
        routes: {
          Dashboard1.id: (context) => Dashboard1(),
          NewsScreen.id: (context) => NewsScreen(),
          IssueScreen.id: (context) => IssueScreen(),
          TeamScreen.id: (context) => TeamScreen(),
          ShowScreen.id:(context)=>ShowScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          AdminScreen.id: (context) => AdminScreen(),
          RemoveScreen.id: (context) => RemoveScreen(),
          ShowScreen2.id:(context)=> ShowScreen2(),
          ItemScreen.id: (context) => ItemScreen(),
          Home.id: (context) => Home(),
          TrendScreen.id: (context) => TrendScreen(),
          Dashboard.id: (context) => Dashboard(),
        
        },
      ),
    );

class Home extends StatefulWidget {
  static const id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
