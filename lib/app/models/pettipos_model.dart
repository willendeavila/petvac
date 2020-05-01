import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petvac/app/models/base_model.dart';

class PetTipos extends BaseModel {
  static const String COLLECTION_NAME = 'PetTipos';
  static const String NOME = "nome";
  String _documentId;
  String nome;

  @override
  String documentId() {
    return this._documentId;
  }

  @override
  BaseModel.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[PetTipos.NOME];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
  }
}
