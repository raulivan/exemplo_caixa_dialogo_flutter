import 'package:flutter/material.dart';

import 'caixa_dialogo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Comunicação com usuário'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: Text('Exibir Informação'),
              onPressed: () {
                var dialogo = new CaixaDialogo();
                dialogo.ok(context, "ATENÇÃO", "Essa é uma mensagem de teste",
                    () {
                  print('Clicou em Ok');
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              child: Text('Sim e Não'),
              onPressed: () {
                var dialogo = new CaixaDialogo();
                dialogo.simOuNao(context, 'ATENÇÃO!', 'Deseja Continuar?', () {
                  print('clicou em sim');
                }, () {
                  print('Clicou em Não');
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              color: Colors.blue,
              icon: Icon(Icons.add_alert),
              onPressed: () {
                var dialogo = new CaixaDialogo();
                dialogo.toast(context, 'Mensagem simples de informação.',
                    duracao: 3, gravidade: 0);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              child: Text('Snack bar'),
              onPressed: () {
                final snackBar = SnackBar(
                    content: Text('Oi! eu sou o Goku'),
                    action: SnackBarAction(
                      label: 'Desfazer',
                      onPressed: () {
                        print('clicou em desfazer');
                      },
                    ),
                    duration: Duration(seconds: 5),);

                _scaffoldKey.currentState.showSnackBar(snackBar,);
                print('snack');
              },
            ),
          ),
        ],
      ),
    );
  }
}
