import 'package:flutter/material.dart';
import 'package:petvac/app/menu/drawer.dart';
import 'package:petvac/models/pettipos_model.dart';

import 'pettipos_bloc.dart';
import 'pettipos_edit_page.dart';

class PetTiposPage extends StatefulWidget {
  static const String rota = '/pettipos';

  final String title;
  const PetTiposPage({Key key, this.title = "Pettipos"}) : super(key: key);

  @override
  _PetTiposPageState createState() => _PetTiposPageState();
}

class _PetTiposPageState extends State<PetTiposPage> {
  var _bloc = PetTiposBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var pettipos = PetTipos()..nome = "";

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetTiposEditPage(pettipos)),
          );
        },
      ),
      drawer: MenuDrawer(),
      body: Container(
        child: StreamBuilder<List<PetTipos>>(
          stream: _bloc.pettipos,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map((pettipos) {
                  return Dismissible(
                    key: Key(pettipos.documentId()),
                    onDismissed: (direction) {
                      _bloc.delete(pettipos.documentId());
                    },
                    child: ListTile(
                      title: Text(pettipos.nome),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetTiposEditPage(pettipos)),
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
