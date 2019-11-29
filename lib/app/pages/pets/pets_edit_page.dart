import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petvac/app/pages/pettipos/pettipos_bloc.dart';
import 'package:petvac/models/pets_model.dart';
import 'package:petvac/models/pettipos_model.dart';
import 'package:rxdart/rxdart.dart';

import 'pets_bloc.dart';

class PetsEditPage extends StatefulWidget {
  PetsEditPage(this.pets);

  final Pets pets;

  @override
  _PetsEditPageState createState() => _PetsEditPageState();
}

class _PetsEditPageState extends State<PetsEditPage> {
  TextEditingController _nomeController;
  final _bloc = PetsBloc();
  final _blocPetTipos = PetTiposBloc();
  final _dateFormat = DateFormat("dd/MM/yyyy");
  PetTipos _pettipo = new PetTipos();

  @override
  void initState() {
    var bloc = _bloc;
    bloc.setPets(widget.pets);
    _nomeController = TextEditingController(text: widget.pets.nome);
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
              Container(height: 20),
              StreamBuilder<DateTime>(
                stream: _bloc.outDataNascimento,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  return InkWell(
                    onTap: () => _selectDataNascimento(context, snapshot.data),
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Data de Nascimento"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(_dateFormat.format(snapshot.data)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(height: 20),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Tipo de Pet",
                  ),
                  child: StreamBuilder<List<PetTipos>>(
                    stream: _blocPetTipos.pettipos,
                    builder: (context, snapshotPetTipos) {
                      var _petTiposId = _bloc.outPetTiposIdValue;

                      return snapshotPetTipos.hasData
                          ? DropdownButton<String>(
                              value: _petTiposId,
                              isExpanded: true,
                              items: snapshotPetTipos.data
                                  .map<DropdownMenuItem<String>>(
                                      (PetTipos pettipos) {
                                return DropdownMenuItem<String>(
                                  value: pettipos.documentId(),
                                  child: Text(pettipos.nome),
                                );
                              }).toList(),
                              onChanged: (String petTiposId) {
                                _petTiposId = petTiposId;
                                _bloc.setPetTiposId(petTiposId);
                              },
                            )
                          : CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Container(height: 20),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Sexo",
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Masculino'),
                        leading: Radio(
                          value: 'M',
                          groupValue: _bloc.outSexoValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setSexo(value);
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Femino'),
                        leading: Radio(
                          value: 'F',
                          groupValue: _bloc.outSexoValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setSexo(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
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

  Future _selectDataNascimento(
      BuildContext context, DateTime initialDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      _bloc.setDataNascimento(picked);
    }
  }
}
