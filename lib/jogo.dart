import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
var _imageAPP = AssetImage("images/padrao.png");
var _mensagemVencedor = '';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = [
      'PEDRA',
      'PAPEL',
      'TESOURA'
    ];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //print("Escolha do APP: " + escolhaApp);
    //print("Escolha do usuário: " + escolhaUsuario);

    switch (escolhaApp) {
      case 'PEDRA':
        setState(() {
          _imageAPP = AssetImage("images/pedra.png");
        });
        break;
      case 'PAPEL':
        setState(() {
          _imageAPP = AssetImage("images/papel.png");
        });
        break;
      case 'TESOURA':
        setState(() {
          _imageAPP = AssetImage("images/tesoura.png");
        });
        break;
    }

    // LOGICA DO VENCEDOR
    if ((escolhaUsuario == 'PEDRA' && escolhaApp == 'TESOURA') || (escolhaUsuario == 'TESOURA' && escolhaApp == 'PAPEL') || (escolhaUsuario == 'PAPEL' && escolhaApp == 'PEDRA')) {
      _mensagemVencedor("VENCEU!!");
    } else if ((escolhaUsuario == 'TESOURA' && escolhaApp == 'PEDRA') || (escolhaUsuario == 'PAPEL' && escolhaApp == 'TESOURA') || (escolhaUsuario == 'PEDRA' && escolhaApp == 'PAPEL')) {
      _mensagemVencedor("PERDEU!!");
    } else {
      _mensagemVencedor("EMPATOU!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Jokenpo"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 1) text
            // 2) image
            // 3) text
            // 4) row (3 images)
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("Escolha do APP", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

            Image(image: _imageAPP);

            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("Escolha uma opção abaixo", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _opcaoSelecionada('PEDRA'),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('PAPEL'),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada('TESOURA'),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                  ),
                ),
              ],
            )
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(_mensagemVencedor, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }
}
