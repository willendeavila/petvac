import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petvac/app/menu/routes.dart';

class SignInPage extends StatefulWidget {
  static const String rota = '/signin';
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _success;
  String _userEmail;
  String _userID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Tela Login')),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const Text('Digite seu Email e Senha'),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Por favor, digite algum texto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Por favor, digite algum texto';
                  }
                  return null;
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.center,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _signInWithEmailAndPassword(context);
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _registerEmailAndPassword(context);
                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                    RaisedButton(
                      onPressed: () async {
                        _signInAnonymously(context);
                        Navigator.pushReplacementNamed(context, Rotas.home);
                      },
                      child: const Text('Anônimo'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    FirebaseUser user;

    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } catch (error) {
      _showDialog(context, error);
    }
  }

  void _signInAnonymously(BuildContext context) async {
    final FirebaseUser user = (await _auth.signInAnonymously()).user;
    
    _success = true;
    _userID = user.uid;
  }

  Future<void> _registerEmailAndPassword(BuildContext context) async {
    FirebaseUser user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } catch (error) {
      _showDialog(context, error);
    }

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }

  _showDialog(BuildContext context, error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Erro"),
          content: new Text(getErrorCodeMessage(error.code)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  getErrorCodeMessage(code) {
    final errors_email = {
      'ERROR_INVALID_EMAIL': 'Endereço de email incorreto',
      'ERROR_WRONG_PASSWORD': 'Senha incorreta',
      'ERROR_USER_NOT_FOUND':
          'Não existe usuário correspondente ao endereço [email] fornecido ou o usuário tiver foi excluído',
      'ERROR_USER_DISABLED':
          'Usuário foi desativado (por exemplo, no console do Firebase)',
      'ERROR_TOO_MANY_REQUESTS':
          'Houve muitas tentativas de login com este usuário',
      'ERROR_OPERATION_NOT_ALLOWED':
          'As contas de email e senha não estão ativadas',
      'ERROR_INVALID_CREDENTIAL':
          'Os dados da credencial estão malformados ou expirarem',
      'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
          'Já existe uma conta com o endereço de e-mail declarado pelo Google. Resolva esse caso chamando [fetchSignInMethodsForEmail] e solicite ao usuário que entre usando um deles. Este erro será gerado apenas se a configuração "Uma conta por endereço de email" estiver ativada no console do Firebase (recomendado).',
      'ERROR_OPERATION_NOT_ALLOWED': 'Contas do Google não estão ativadas.',
      'ERROR_INVALID_ACTION_CODE':
          'Código de ação no link esta malformado, expirado ou já foi usado. Isso pode ocorrer apenas ao usar [EmailAuthProvider.getCredentialWithLink] para obter a credencial.',
      'ERROR_NOT_ALLOWED':
          'As contas de email e link de entrada de email não estão ativadas. Habilite-os na seção Auth do console do Firebase.',
      'ERROR_DISABLED': 'A conta do usuário está desativada.',
      'ERROR_INVALID': 'O endereço de email é inválido.',
      'ERROR_INVALID_CUSTOM_TOKEN':
          'O formato do token personalizado está incorreto. Por favor, verifique a documentação.',
      'ERROR_CUSTOM_TOKEN_MISMATCH': 'Configuração inválida.',
      'ERROR_WEAK_PASSWORD': 'A senha não é forte o suficiente.',
      'ERROR_INVALID_EMAIL': 'O endereço de email esta incorreto.',
      'ERROR_EMAIL_ALREADY_IN_USE':
          'O email já esta em uso por uma conta diferente.'
    };

    return errors_email[code];
  }
}
