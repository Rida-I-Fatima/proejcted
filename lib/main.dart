import 'package:flutter/material.dart';
import 'package:flutterproject/provider/signin.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   static final String title = 'MainPage';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider( 
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      
      debugShowCheckedModeBanner: false,
      
      home: MyHomePage(),
    ),
  );
  }