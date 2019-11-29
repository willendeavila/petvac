import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:petvac/models/pets_model.dart';
import 'package:rxdart/rxdart.dart';

class PetsRepository extends Disposable {
  CollectionReference _collection = Firestore.instance.collection('Pets');

  void add(Pets pets) => _collection.add(pets.toMap());

  void update(String documentId, Pets pets) =>
      _collection.document(documentId).updateData(pets.toMap());

  void delete(String documentId) => _collection.document(documentId).delete();

  Observable<List<Pets>> get pets =>
      Observable(_collection.snapshots().map((query) => query.documents
          .map<Pets>((document) => Pets.fromMap(document))
          .toList()));

  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }
  
  //dispose will be called automatically
  @override
  void dispose() {}
}
