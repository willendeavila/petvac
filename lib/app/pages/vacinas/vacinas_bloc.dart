import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/models/vacinas_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../app_module.dart';
import 'vacinas_repository.dart';

class VacinasBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<VacinasRepository>();
  get vacinas => _repository.vacinas;

  // VacinasEdit
  String _documentId;
  String _nome;

  VacinasBloc() {
    _nomeController.listen((value) => _nome = value);
  }

  void setVacinas(Vacinas vacinas) {
    _documentId = vacinas.documentId();
    setNome(vacinas.nome);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;

  void setNome(String valor) => _nomeController.sink.add(valor);

  bool insertOrUpdate() {
    var vacinas = Vacinas()
      ..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(vacinas);
    } else {
      _repository.update(_documentId, vacinas);
    }

    return true;
  }

  void delete(String documentId) => _repository.delete(documentId);

  @override
  void dispose() {
    _nomeController.close();
    super.dispose();
  }
}
