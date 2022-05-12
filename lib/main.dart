import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_app_restart/flutter_app_restart.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatefulWidget {
  @override
  _MeuAppState createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  String mensagemVisor = '';

  void realizarCalculo(String expression){
    Parser p = Parser();
    Expression exp = p.parse(expression);

    ContextModel cm = ContextModel();
    double resposta = exp.evaluate(EvaluationType.REAL, cm);
    print('Reposta: $resposta');

    setState(() {
      mensagemVisor = resposta.toString();
    });
  }

  void resetarAPP(){
    setState(() {
      mensagemVisor = '';
    });
  }

  void setValor(String teclaPress){
    setState(() {
      if(teclaPress == '='){
        realizarCalculo(mensagemVisor);
      }else{
        if(teclaPress == 'C' || teclaPress == 'Deletar'){
          mensagemVisor = '';
        }else{
          if(mensagemVisor == ''){
            mensagemVisor = teclaPress;
          }else{
            mensagemVisor+=teclaPress;
            print(mensagemVisor);
          }
        }
      }

    });
  }

  Expanded btnOperacoes(String mensagemTela, String icon, Color cor){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.black12),
        onPressed: () {
            setValor(mensagemTela);
        },
        child: Text(
          icon,
          style: TextStyle(
            color: cor,
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text('Calculadora'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.white,
              margin: EdgeInsets.all(15),
              width: 400,
              height: 120,
              child: Text(
                mensagemVisor,
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.all(15),
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          btnOperacoes('C', 'C', Colors.blue),
                          btnOperacoes('Deletar', 'DEL', Colors.blue),
                          btnOperacoes('%', '%', Colors.blue),
                          btnOperacoes('/', '/', Colors.blue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          btnOperacoes('7', '7', Colors.white),
                          btnOperacoes('8', '8', Colors.white),
                          btnOperacoes('9', '9', Colors.white),
                          btnOperacoes('*', '*', Colors.blue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          btnOperacoes('4', '4', Colors.white),
                          btnOperacoes('5', '5', Colors.white),
                          btnOperacoes('6', '6', Colors.white),
                          btnOperacoes('+', '+', Colors.blue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          btnOperacoes('1', '1', Colors.white),
                          btnOperacoes('2', '2', Colors.white),
                          btnOperacoes('3', '3', Colors.white),
                          btnOperacoes('-', '-', Colors.blue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          btnOperacoes('0', '0', Colors.white),
                          btnOperacoes('.', '.', Colors.white),
                          btnOperacoes('=', '=', Colors.blue),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
