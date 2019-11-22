import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petvac/app/menu/drawer.dart';
import 'package:petvac/app/menu/routes.dart';

class HomePage extends StatefulWidget {
  final String title;
  static const String rota = '/home';

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return FlatButton(
                child: const Text('Logoff'),
                textColor: Theme.of(context).buttonColor,
                onPressed: () async {
                  final FirebaseUser user = await _auth.currentUser();
                  if (user == null) {
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ninguém esta logado!"),
                      ),
                    );
                    return;
                  }
                  _signOut();
                  Navigator.pushReplacementNamed(context, Rotas.signin);
                }
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }

  void _signOut() async {
    await _auth.signOut();
  }
}
