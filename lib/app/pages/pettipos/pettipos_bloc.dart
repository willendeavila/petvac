import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/models/pettipos_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'pettipos_repository.dart';

class PetTiposBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<PetTiposRepository>();
  Observable<List<PetTipos>> get pettipos => _repository.pettipos;

  Future<List<PetTipos>> listpettipos() async {
    List<PetTipos> petTipos = new List<PetTipos>();

    _repository.pettipos.forEach((List<PetTipos> _pettipos) {
      petTipos.addAll(_pettipos);
    });

    return petTipos;
  }

  // VacinasEdit
  String _documentId;
  String _nome;

  PetTiposBloc() {
    _nomeController.listen((value) => _nome = value);
  }

  void setPettipos(PetTipos pettipos) {
    _documentId = pettipos.documentId();
    setNome(pettipos.nome);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;

  void setNome(String valor) => _nomeController.sink.add(valor);

  bool insertOrUpdate() {
    var pettipos = PetTipos()..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(pettipos);
    } else {
      _repository.update(_documentId, pettipos);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);
  
  @override
  void dispose() {
    super.dispose();
  }
}
