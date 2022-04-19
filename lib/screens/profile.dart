import 'package:flutter/material.dart';
import 'package:flutterproject/provider/signin.dart';
import 'package:flutterproject/screens/menu.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';





class profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

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
      body: Stack(
        children: <Widget>[
         
           
          Container(
            margin: EdgeInsets.only(left: 40, right: 50, top: 200, bottom: 4,),

            
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Text(user.displayName.toUpperCase(), textScaleFactor: 1.2, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,)),
              ),),
              Container(
            margin: EdgeInsets.only(left: 30, right: 50, top: 220, bottom: 4,),

              child: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(user.email,  textScaleFactor: 1.1, style: const TextStyle(fontSize: 15, color: Colors.white,)),
              ),
              ),
           Container(
            margin: EdgeInsets.only(left: 160, right: 10, top: 100, bottom: 4,),

              child: 
                CircleAvatar(
                  radius: 40,
                  child: ClipOval(
                    child: Column(
                  children: <Widget>[
                              Image(
                                  image: NetworkImage(user.photoURL),
                                    fit: BoxFit.cover,
                      width: 90,
                      height: 80,
                              ),
                            ],
                  ),
                    ),
                  ),
              
          ),
            Container(
              margin: EdgeInsets.only(left: 150, right: 50, top: 18, bottom: 4,),
              child: Column(
              children: <Widget>[
              Text('My Profile', textScaleFactor: 1.6, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,)),                         
                          
                        ],
                        
              ),
              
              
            ),
             Container(
                  margin: EdgeInsets.only(left: 160, right: 50, top: 350, bottom: 0,),

               child: ElevatedButton(
                 child: const Text('Logout', textScaleFactor: 1.2, style: const TextStyle(fontSize:15,  color:Color(0xFF2E454B))),
                  
                  onPressed: (){final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout(); 
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
                },
                  
                   style: ElevatedButton.styleFrom(
                primary: const Color(0xffffffff),
                shape: new RoundedRectangleBorder(
               borderRadius: new BorderRadius.circular(30.0),
               ),
                minimumSize: Size(20, 50)
                
               ),

                )
                ),
        ],
        
      ),
      
    );
  }
}