import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petvac/app/menu/drawer.dart';
import 'package:petvac/models/pets_model.dart';

import 'pets_bloc.dart';
import 'pets_edit_page.dart';

class PetsPage extends StatefulWidget {
  static const String rota = '/pets';

  final String title;
  const PetsPage({Key key, this.title = "Pets"}) : super(key: key);

  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  var _bloc = PetsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var pets = Pets()
            ..data_nascimento = DateTime.now()
            ..nome = ""
            ..pettipos_id = ""
            ..sexo = ""
            ..user_id = "";

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetsEditPage(pets)),
            //PetsEditPage(pettipos)),
          );
        },
      ),
      body: Container(
        child: StreamBuilder<List<Pets>>(
          stream: _bloc.pets,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((pets) {
                  return Dismissible(
                    key: Key(pets.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(pets.documentId());
                    },
                    child: ListTile(
                      title: Text(pets.nome),
                      //subtitle: Text(pettipos.data_nascimento.toString()),
                      subtitle: Text(new DateFormat("dd-MM-yyyy")
                          .format(pets.data_nascimento)),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetsEditPage(pets)),
                          //PetsEditPage(pettipos)),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
