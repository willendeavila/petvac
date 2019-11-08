import 'package:flutter/material.dart';
import 'package:petvac/app/menu/drawer.dart';
import 'package:petvac/models/vacinas_model.dart';

import 'vacinas_bloc.dart';
import 'vacinas_edit_page.dart';

class VacinasPage extends StatefulWidget {
  final String title;
  static const String rota = '/vacinas';

  const VacinasPage({Key key, this.title = "Vacinas"}) : super(key: key);

  @override
  _VacinasPageState createState() => _VacinasPageState();
}

class _VacinasPageState extends State<VacinasPage> {
  var _bloc = VacinasBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            var vacinas = Vacinas()..nome = "";

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VacinasEditPage(vacinas)),
            );
          },
        ),
        drawer: MenuDrawer(),
        body: Container(
            child: StreamBuilder<List<Vacinas>>(
                stream: _bloc.vacinas,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  return Container(
                    child: ListView(
                      children: snapshot.data.map((vacinas) {
                        return Dismissible(
                            key: Key(vacinas.documentId()),
                            onDismissed: (direction) {
                              _bloc.delete(vacinas.documentId());
                            },
                            child: ListTile(
                              title: Text(vacinas.nome),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VacinasEditPage(vacinas)),
                                );
                              },
                            ));
                      }).toList(),
                    ),
                  );
                })));
  }
}
