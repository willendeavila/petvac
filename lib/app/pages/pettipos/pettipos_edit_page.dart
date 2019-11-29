import 'package:flutter/material.dart';
import 'package:petvac/models/pettipos_model.dart';

import 'pettipos_bloc.dart';

class PetTiposEditPage extends StatefulWidget {
  PetTiposEditPage(this.pettipos);

  final PetTipos pettipos;

  @override
  _PetTiposEditPageState createState() => _PetTiposEditPageState();
}

class _PetTiposEditPageState extends State<PetTiposEditPage> {
  TextEditingController _nomeController;
  final _bloc = PetTiposBloc();

  @override
  void initState() {
    var bloc = _bloc;
    bloc.setPettipos(widget.pettipos);
    _nomeController = TextEditingController(text: widget.pettipos.nome);
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
