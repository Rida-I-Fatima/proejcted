import 'package:flutter/material.dart';
import 'package:flutterproject/screens/home_page.dart';


class history extends StatefulWidget {

 


  @override
  State<history> createState() => _history();
}

class _history extends State<history> {
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
      body: Stack(
        children: <Widget>[
         Container(
              margin: EdgeInsets.only(left: 125, right: 23, top: 18, bottom: 4,),
              child: Column(
              children: <Widget>[
              Text('Patient History', textScaleFactor: 1.6, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,)),                         
                          
                        ],
                        
              ),
              
              
            ),
        ],
      ),
      
    );
  }
}