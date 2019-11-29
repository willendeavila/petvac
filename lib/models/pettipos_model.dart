import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class PetTipos extends ModeloBase {
  String _documentId;
  String nome;

  PetTipos();

  PetTipos.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID.toString(); 

    this.nome = documento.data["nome"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
    
    return map;
  }

  @override
  String documentId() => _documentId;
}
