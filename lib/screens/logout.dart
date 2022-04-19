
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'package:flutterproject/screens/menu.dart';
import 'package:flutterproject/screens/profile.dart';

class logout extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    
    body: StreamBuilder(
    
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
           return Center(child: CircularProgressIndicator());
          else if (snapshot.hasData) {
           return profile();
          
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong!'));
          
        } else{
          return MyHomePage();
        }
        },
        
      ),
      
  );
  
}