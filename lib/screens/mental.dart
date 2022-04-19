import 'package:flutter/material.dart';
import 'package:flutterproject/screens/home_page.dart';
import 'dart:io';
import 'dart:async';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ffi';
import 'package:flutterproject/screens/medical.dart';
import 'package:image_cropper/image_cropper.dart';

class mental extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<mental> {
   PickedFile? _image;
  bool _loading = false;
   //File _selectedFile;
  // _inProcess = false;
  List<dynamic>?_outputs;


  void initState() {
    super.initState();
    _loading = true;
    
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
}


//Load the Tflite model
loadModel() async {
    await Tflite.loadModel(
      model: "assets/images/model_unquant.tflite",
      labels: "assets/images/labels.txt",
    );
}

classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      //Declare List _outputs in the class which will be used to show the classified classs name and confidence
      _outputs = output;
    });
  }
  Future pickImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }


  final ImagePicker _picker = ImagePicker();

    @override
  Widget build(BuildContext context) {
    //SingleChildScrollView
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF2E454B),
        centerTitle: true,
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
        title: Container(
                
        height: 50,

        // width: size.width,
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Color(0xFF2E454B),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 60,
              width: 50,
              child: Column(
              children: <Widget>[
                          Image(
                                image: AssetImage('assets/images/mental.png'),
                                height: 50,
                          ),
                          
                        ],
                        
              ),
              
              
            ),
            
             Container(
              margin: EdgeInsets.only(left: 20, right: 10, top: 15, bottom: 3,),
              child: Column(
              children: <Widget>[
                Text('Mental Disorder', textScaleFactor: 1.2, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                         
                          
                        ],
                        
              ),
              
              
            ),
            
          ], 
        ),
      
              ),
        
      ),
           backgroundColor: const Color(0xFF2E454B),
 
      body: _loading
      
      
          ? Container(
            
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          
          : Container(
            
              margin: EdgeInsets.only(left: 50, right: 50, top: 40, bottom: 10,),

             height: 350,
            width: 350, 
            child: Align(
          alignment: Alignment.center,
                    
                //width: MediaQuery.of(context).size.width,
                child:Card(
                 
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    _image == null ? Container() : Image.file(File(_image!.path)),
                    
                    _outputs != null && _outputs!.isNotEmpty   //outputt
                        ? Text('${_outputs![0]["label"]}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              background: Paint()..color = Colors.white,
                            ),
                          )
                        : Container(
                                 
       
                        )
                        
                         
                  ],
                  
                   
                ),
          ),
          

          
              ),
          ),
          
         
          persistentFooterButtons: <Widget>[
            
           
             ElevatedButton(
               
               
          child: const Text('Consult a Psychiatrist', textScaleFactor: 1.6, style: const TextStyle(fontSize:15,  color: Color(0xFF2E454B))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => medical()),
            );
          },
          style: ElevatedButton.styleFrom(
            
            
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            
                primary: const Color(0xffffffff),
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35))
               ),
       ),
            ],
          
          floatingActionButton: FloatingActionButton(
        onPressed: _optiondialogbox,
        backgroundColor: Color.fromARGB(255, 64, 90, 97),
        child: Icon(Icons.image),
      ), 
      
      

      
       
      
         
      
    
          
      
    );
    
  }

  //camera method
  Future<void> _optiondialogbox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF2E454B),
            
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "Take a Picture",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text(
                      "Select image ",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onTap: openGallery,
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = image ;
    });
  }

  //camera method
  Future openGallery() async {
    var piture = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = piture;
    }
     
    );
    classifyImage(piture);
  }
}
