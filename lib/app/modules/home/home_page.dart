import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            _addDrawerItem(
              Icons.home,
              'Home',
              null,
            ),
            _addDrawerItem(
              Icons.mouse,
              'Tipos de Pet',
              null,
            ),
            _addDrawerItem(
              Icons.mood,
              'Pet',
              null,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

Widget _addDrawerItem(_icon, _text, _onTap) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(_icon),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(_text),
        )
      ],
    ),
    onTap: _onTap,
  );
}
