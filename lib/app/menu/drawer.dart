import 'package:flutter/material.dart';
import 'routes.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Home',
              onTap: () => Navigator.pushReplacementNamed(context, Rotas.home)),
          Divider(),
          _createDrawerItem(icon: Icons.collections_bookmark, text: 'Passos'),
          _createDrawerItem(icon: Icons.face, text: 'Autores'),
          _createDrawerItem(
              icon: Icons.account_box, text: 'Documentação do Flutter'),
          _createDrawerItem(icon: Icons.stars, text: 'Links Úteis'),
          Divider(),
          _createDrawerItem(
              icon: Icons.bug_report, text: 'Relatório de Issues'),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/programmer_dog.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("PetVac Menu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
