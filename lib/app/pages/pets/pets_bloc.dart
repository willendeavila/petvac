import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/models/pets_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'pets_repository.dart';

class PetsBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<PetsRepository>();
  get pets => _repository.pets;

  String _documentId;
  DateTime _data_nascimento;
  String _nome;
  String _pettipos_id;
  String _sexo;
  String _user_id;

   PetsBloc() {
    _dataNascimentoController.listen((value) => _data_nascimento = value);
    _nomeController.listen((value) => _nome = value);
    _petTiposIdController.listen((value) => _pettipos_id = value);
    _sexoController.listen((value) => _sexo = value);
    _userIdController.listen((value) => _user_id = value);
  }

  void setPets(Pets pets) {
    _documentId = pets.documentId();
    setNome(pets.nome);
    setDataNascimento(pets.data_nascimento);
    setPetTiposId(pets.pettipos_id);
    setSexo(pets.sexo);
    setUserId(pets.user_id);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String valor) => _nomeController.sink.add(valor);

  var _dataNascimentoController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outDataNascimento => _dataNascimentoController.stream;
  void setDataNascimento(DateTime valor) =>
      _dataNascimentoController.sink.add(valor);

  var _petTiposIdController = BehaviorSubject<String>();
  Stream<String> get outPetTiposId => _petTiposIdController.stream;
  String get outPetTiposIdValue => _petTiposIdController.stream.value;
  void setPetTiposId(String valor) => _petTiposIdController.sink.add(valor);

  var _sexoController = BehaviorSubject<String>();
  Stream<String> get outSexo => _sexoController.stream;
  String get outSexoValue => _sexoController.stream.value;
  void setSexo(String valor) => _sexoController.sink.add(valor);

  var _userIdController = BehaviorSubject<String>();
  Stream<String> get userId => _userIdController.stream;
  void setUserId(String valor) => _userIdController.sink.add(valor);

  bool insertOrUpdate() { 
    var pets = Pets()
      ..data_nascimento = _data_nascimento
      ..nome = _nome
      ..pettipos_id = _pettipos_id
      ..sexo = _sexo
      ..user_id = _user_id;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(pets);
    } else {
      _repository.update(_documentId, pets);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    _dataNascimentoController.close();
    _nomeController.close();
    _petTiposIdController.close();
    _sexoController.close();
    _userIdController.close();
    super.dispose();
  }
}
