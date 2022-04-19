import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';



final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('output');


class FirebaseDB {

  static Future<String> addOutPutFirebase({
    required String output,
  }) async {

    String status='Failed to Save the Output';
    DocumentReference documentReferencer =
    _mainCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "output": output,
      "time" : DateTime.now().toString(),
      //"user" : FirebaseAuth.instance.currentUser!.uid.toString(),
      "user" : "",
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => status='Output Saved to Firebase.')
        .catchError((e) => status=e.toString());
    return status;
  }



}
