import 'package:flutter/material.dart';
import 'package:petvac/app/pages/vacinas/vacinas_bloc.dart';
import 'package:petvac/models/vacinas_model.dart';

class VacinasEditPage extends StatefulWidget {
  VacinasEditPage(this.vacinas);

  final Vacinas vacinas;

  @override
  _VacinasEditPageState createState() => _VacinasEditPageState();
}

class _VacinasEditPageState extends State<VacinasEditPage> {
  TextEditingController _nomeController;
  final _bloc = VacinasBloc();

  @override
  void initState() {
    _bloc.setVacinas(widget.vacinas);
    _nomeController = TextEditingController(text: widget.vacinas.nome);
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PetVac"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {
                    if (_bloc.insertOrUpdate()) {
                      Navigator.pop(context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
