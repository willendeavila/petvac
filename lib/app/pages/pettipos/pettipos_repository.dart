import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/models/pettipos_model.dart';
import 'package:rxdart/rxdart.dart';

class PetTiposRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('PetTipos'); 
  PetTipos _petTipos;

  PetTipos getPetTipos() => _petTipos;

  void add(PetTipos pettipos) => _collection.add(pettipos.toMap());

  void update(String documentId, PetTipos pettipos) =>
      _collection.document(documentId).updateData(pettipos.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<PetTipos>> get pettipos =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<PetTipos>((document) => PetTipos.fromMap(document))
          .toList()));

  Observable<PetTipos> petTiposId(String petTiposId) => 
    Observable(_collection.document(petTiposId).snapshots().map<PetTipos>(
      (document) => PetTipos.fromMap(document)));
  
  Future<PetTipos> getPetTiposById(String _petTiposId) async {
    DocumentSnapshot petTipos = await _collection.document(_petTiposId).get();

    _petTipos = PetTipos.fromMap(petTipos);

    return _petTipos;
  }
  
  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
