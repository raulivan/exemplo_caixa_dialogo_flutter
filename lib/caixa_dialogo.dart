import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CaixaDialogo {
  void ok(
      BuildContext context, String titulo, String msg, VoidCallback okOnClick) {
    var btnOK = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          okOnClick();
        });

    var alerta = AlertDialog(
      title: Text(titulo),
      content: Text(msg),
      actions: [
        btnOK,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void simOuNao(BuildContext context, String titulo, String msg,
      VoidCallback simOnClick, VoidCallback naoOnClick) {
    Widget naoButton = FlatButton(
      child: Text("Não"),
      onPressed: (){
        Navigator.of(context).pop();
        naoOnClick();
      } 
    );

    Widget simButton = FlatButton(
      child: Text("Sim"),
      onPressed: (){
        Navigator.of(context).pop();
        simOnClick();
      }
    );

    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(titulo),
      content: Text(msg),
      actions: [
        naoButton,
        simButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void toast(BuildContext context, String msg, {int duracao, int gravidade} ){
    Toast.show(msg, context, duration: duracao, gravity: gravidade);
  }
}
