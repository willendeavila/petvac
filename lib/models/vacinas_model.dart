import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Vacinas extends ModeloBase {
  String _documentId;
  String nome;

  Vacinas();

  Vacinas.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

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
