import 'package:flutter/material.dart';
import 'package:flutterproject/screens/menu.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class about extends StatefulWidget {

 


  @override
  State<about> createState() => _about();
}

class _about extends State<about> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
        elevation: 0.0,
        toolbarHeight: 150,
        backgroundColor: const Color(0xFF2E454B),
        centerTitle: true,
        
        leading: GestureDetector(
          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
    child: Icon(
      Icons.arrow_back,
          color: Colors.white,
          size: 40,
        ),
        ),
        actions: [
          GestureDetector(
             onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
             },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
                
              ),
            ),
          )
        
        ],
        title:  Container(
                  height: 120,
                  margin: EdgeInsets.only(left: 20, right: 30),

                  child: Row(
                           mainAxisAlignment : MainAxisAlignment.center,
                           
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        
                      )
                    ]
                  ),
                ),
        
        ),
      ),
        
        
      backgroundColor: const Color(0xFF2E454B),
      body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5.0,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 35.0),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Handwriting Analyzer',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0, color: Color(0xFF2E454B))),
                      Text('Mental Disorder and Personality Prediction',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0)),
                      SizedBox(height: 10.0),
                      Text(
                        '''This system will be able to predict the mental disorder and personality traits of the individual using his handwriting.Through this app the user will be able to look for his personality traits and mental health using only his handwriting without self-learning. When the user will give the picture of a handwritten paragraph to the system as input the system will analyze the picture using the image processing approach.
For mental health detection, If the person is detected with any mental disorder he can consult with the doctor through this app. The history of the user will also be recorded whenever he checks his condition. The new record will be added to the previous list that will help the doctor for the treatment of the patient in the future.This character traits prediction will satisfy the person's obsession with his personality.

                        ''',
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 30, 100, 20),
                        child: SizedBox(
                          height: 1.0,
                          child: Container(
                            color: Color(0xFF2E454B),
                          ),
                        ),
                      ),
                      
                      Text('Developers',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0, color:Color(0xFF2E454B))),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Tanza\nRida-I-Fatima',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14.0)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 30, 100, 20),
                        child: SizedBox(
                          height: 1.0,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  ),
      
    );
  }
}