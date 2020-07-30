import 'package:flutter/material.dart';

import '../main.dart';

class Widgets_pt3 extends StatelessWidget {
  const Widgets_pt3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PT3'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text('PT3'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        //se envia el context para abajp
        onPressed: () => _mostrarAlert(context),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        // requiere el context y se manda como argumento desde arriba
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize
                  .min, //para hacer que la columna se autoadapte al contenido
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(size: 100)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              FlatButton(
                  onPressed: () {
                    //funcion anonima
                  },
                  child: Text('OK')),
            ],
          );
        });
  }
}
