import 'package:cloud_firestore/cloud_firestore.dart';

import 'modelo_base.dart';

class Pets extends ModeloBase {
  String _documentId;
  DateTime data_nascimento;  
  String nome;
  String pettipos_id; 
  String sexo;  
  String user_id; 

  Pets();

  Pets.fromMap(DocumentSnapshot documento) {
    _documentId = documento.documentID;

    Timestamp ts = documento.data["data_nascimento"];
    this.data_nascimento = DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);
    this.nome = documento.data["nome"];
    this.pettipos_id = documento["pettipos_id"];
    this.sexo = documento["sexo"];
    this.user_id = documento["user_id"];  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['data_nascimento'] = this.data_nascimento;
    map['nome'] = this.nome;
    map['pettipos_id'] = this.pettipos_id; 
    map['sexo'] = this.sexo;
    map['user_id'] = this.user_id;

    return map;
  }

  @override
  String documentId() => _documentId;
}
