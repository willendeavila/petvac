import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/app/models/pettipos_model.dart';
import 'package:rxdart/rxdart.dart';

class PettiposRepository extends Disposable {
  CollectionReference _collection =
      Firestore.instance.collection(PetTipos.COLLECTION_NAME);

  void add(PetTipos _pettipos) => _collection.add(_pettipos.toMap());

  void update(String _documentId, PetTipos _petTipos) =>
      _collection.document(_documentId).updateData(_petTipos.toMap());

  void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<PetTipos>> get getAll =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<PetTipos>((document) => PetTipos.fromMap(document))
          .toList()));

  Future<PetTipos> getById(String _documentId) async {
    DocumentSnapshot petTipos = await _collection.document(_documentId).get();

    return PetTipos.fromMap(petTipos);
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
