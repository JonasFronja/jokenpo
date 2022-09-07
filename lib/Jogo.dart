import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _jogadaApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  var _placarApp = 0;
  var _placarUsuario = 0;

  void _opcaoSelecionada(String jogadaUsuario){
    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];
    setState(() {
      _jogadaApp = AssetImage("images/"+escolhaApp+".png");
    });

    var mensagemResultado = "";
    if(jogadaUsuario == escolhaApp){
      mensagemResultado = "Deu empate!";
    }
    else if((jogadaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (jogadaUsuario == "papel" && escolhaApp == "pedra") ||
        (jogadaUsuario == "tesoura" && escolhaApp == "papel")){
      mensagemResultado = "Parabéns você ganhou :)";
      setState(() {
        _placarUsuario = _placarUsuario +1;
      });
    }else{
      setState(() {
        _placarApp = _placarApp +1;
      });
      mensagemResultado = "Ah não você perdeu :(";
    }
    setState(() {
      _mensagem = mensagemResultado;
    });
  }

  void _resetarJogo(){
    setState(() {
      _jogadaApp = AssetImage("images/padrao.png");
      _mensagem = "Escolha uma opção abaixo:";
      _placarApp = 0;
      _placarUsuario = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JoKenPo"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:Text(
              "Escolha do app:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Image(image: this._jogadaApp,height: 115),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:Text(
              "$_mensagem",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png",height: 95),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png",height: 95),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png",height: 95),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child:RaisedButton(
              child: Text(
                "Resetar Jogo",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              color: Colors.black54,
              onPressed: _resetarJogo,
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: 16,bottom: 16),
            child: Text(
              "PLACAR",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Você",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ), Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "$_placarUsuario",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "$_placarApp",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
