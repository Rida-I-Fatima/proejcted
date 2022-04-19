import 'package:flutter/material.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'package:flutterproject/screens/personality.dart';


class pout extends StatefulWidget {

 


  @override
  State<pout> createState() => _pout();
}

class _pout extends State<pout> {
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
          onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
          decoration: BoxDecoration(
              color: 
                 Color(0xFF2E454B),
                  
              
            
          ),
          ),
           Container(
              margin: EdgeInsets.only(left: 60, right: 23, top: 18, bottom: 4,),
              child: Column(
              children: <Widget>[
                Text('This is what your handwriting\npredicts about your personality.', textScaleFactor: 1.4, style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold, color: Colors.white))
                          
                        ],
                        
              ),             
              
            ),
           new Container(
                           margin: EdgeInsets.only(left: 70, right: 20, top: 120, bottom: 4,),

            height: 250.0,
            width: 270.0,
            color: Colors.white,
               
  
                        
                        
                  
            
      
      
  ),
  
  
      Container(
    margin: EdgeInsets.only(left: 110, right: 40, top: 160, bottom: 4,),

   child: Text('Your handwriting\nreveals that you\nare honest,having\nadmirable qualities\nand adaptability.', textScaleFactor: 1.6, style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold, color: Color(0xff14274F)))
   
  ),  
    
    

     
  
  
  
  
     SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                
              ],
            ),
          ),
         ),
        ],
      ),
    );
  }
}