import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/screens/mental.dart';
import 'package:flutterproject/screens/history.dart';
import 'package:flutterproject/screens/medical.dart';
import 'package:flutterproject/screens/personality.dart';
import 'package:provider/provider.dart';
import '../provider/signin.dart';
import 'menu.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(fontSize: 14, color: Color.fromRGBO(63, 63, 63, 1));
    return Scaffold(
      drawer: menu(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
        elevation: 0.0,
        toolbarHeight: 150,
        backgroundColor: const Color(0xFF2E454B),
        centerTitle: true,
        
        
        iconTheme: IconThemeData(size: 35,color: Colors.white),
        title:  Container(
                  height: 120,
                  margin: EdgeInsets.only(left: 20, right: 70),

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
      
      body: Stack(
        children: <Widget>[
         SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
            
               Expanded(
                child: Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: ListView(
                  children: [
                    demoTopRatedDr(
                      "Predict Mental Disorder", 
                      "assets/images/mental.png",

                    ),
                    demoTopRated(
                      "Predict Personality Traits", 
                      "assets/images/personality.png",

                    ),
                    demoTopRate(
                      "Medical Consultancy", 
                      "assets/images/doctor.png",

                    ),
                    demoTopRating(
                      "Patient History", 
                      "assets/images/history.png",

                    ),
                 
                  ],
                ),
                ),
               ),
                
               
              
              ]
            ),
          ),
         ),
        ],
       
        
      ),
      
    );
         
      
    
    
  

  }

Widget demoTopRatedDr(String img, String name) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
     onTap: () async {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.googleLogin();
                var user = FirebaseAuth.instance.currentUser;
                if (user!=null) {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context) => mental()));
                } else {
                  // No user is signed in.
                }
              },
      child: Container(
                
        height: 65,

        // width: size.width,
        margin: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 80,
              width: 50,
              child: Column(
              children: <Widget>[
                          Image(
                                image: AssetImage('assets/images/mental.png'),
                                height: 60,
                          ),
                          
                        ],
                        
              ),
              
              
            ),
             Container(
              margin: EdgeInsets.only(left: 20, right: 23, top: 23, bottom: 4,),
              child: Column(
              children: <Widget>[
                Text('Predict Mental Disorder', textScaleFactor: 1.2, style: const TextStyle(fontWeight: FontWeight.bold,color:Color(0xFF2E454B)))
                         
                          
                        ],
                        
              ),
              
              
            ),
            
          ], 
        ),
      
              ),
             
    );
      

                   
                
} 
Widget demoTopRated(String img, String name) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.googleLogin();
                var user = FirebaseAuth.instance.currentUser;
                if (user!=null) {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
                } else {
                  // No user is signed in.
                }
              },
      child: Container(
                
        height: 65,

        // width: size.width,
        margin: EdgeInsets.only(top: 35),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 80,
              width: 50,
              child: Column(
              children: <Widget>[
                          Image(
                                image: AssetImage('assets/images/personality.png'),
                                height: 60,
                          ),
                          
                        ],
                        
              ),
              
              
            ),
             Container(
              margin: EdgeInsets.only(left: 10, right: 23, top: 23, bottom: 4,),
              child: Column(
              children: <Widget>[
                Text('Predict Personality Traits', textScaleFactor: 1.2, style: const TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF2E454B)))
                         
                          
                        ],
                        
              ),
              
              
            ),
            
          ], 
        ),
      
              ),
             
    );
      

                   
                
} 
Widget demoTopRate(String img, String name) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => medical()));

      },
      child: Container(
                
        height: 65,

        // width: size.width,
        margin: EdgeInsets.only(top: 35),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 80,
              width: 50,
              child: Column(
              children: <Widget>[
                          Image(
                                image: AssetImage('assets/images/doctor.png'),
                                height: 60,
                          ),
                          
                        ],
                        
              ),
              
              
            ),
             Container(
              margin: EdgeInsets.only(left: 20, right: 23, top: 23, bottom: 4,),
              child: Column(
              children: <Widget>[
                Text('Medical Consultancy', textScaleFactor: 1.2, style: const TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF2E454B)))
                         
                          
                        ],
                        
              ),
              
              
            ),
            
          ], 
        ),
      
              ),
             
    );
      

                   
                
} 
Widget demoTopRating(String img, String name) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.googleLogin();
                var user = FirebaseAuth.instance.currentUser;
                if (user!=null) {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder:(context) => history()));
                } else {
                  // No user is signed in.
                }
              },
      child: Container(
                
        height: 65,

        // width: size.width,
        margin: EdgeInsets.only(top: 35),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 80,
              width: 50,
              child: Column(
              children: <Widget>[
                          Image(
                                image: AssetImage('assets/images/history.png'),
                                height: 60,
                          ),
                          
                        ],
                        
              ),
              
              
            ),
             Container(
              margin: EdgeInsets.only(left: 20, right: 23, top: 23, bottom: 4,),
              child: Column(
              children: <Widget>[
                Text('Patient History', textScaleFactor: 1.2, style: const TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF2E454B)))
                         
                          
                        ],
                        
              ),
              
              
            ),
            
          ], 
        ),
      
              ),
             
    );
      

                   
                
} 
}
   
  
