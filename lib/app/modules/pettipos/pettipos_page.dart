import 'package:flutter/material.dart';
import 'package:petvac/app/utils/main_drawer.dart';

class PetTiposPage extends StatefulWidget {
  final String title;
  static const String route = '/petTipos';

  const PetTiposPage({Key key, this.title = "Pettipos"}) : super(key: key);

  @override
  _PetTiposPageState createState() => _PetTiposPageState();
}

class _PetTiposPageState extends State<PetTiposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
