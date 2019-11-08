import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ModeloBase {
  ModeloBase();  
 
  ModeloBase.fromMap(DocumentSnapshot documento);
  toMap();  
  String documentId();    
}
