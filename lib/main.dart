import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_app_restart/flutter_app_restart.dart';

//TODO - 9: Importe o pacote math_expressions.

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
      //TODO - 4: No método onPressed faça uma chamada para o método setValor e passe o valor da tecla pressionada. Lembre-se que nessa altura seu código já deve estar otimizado para que os botões sejam construídos através de uma função.
      //TODO - 5: Dentro do método setValor insira um setState e dentro do setState crie uma estrutura condicional que deve testar
      // se a variável mensagemVisor é igual a 0. Caso seja, a variável mensagemVisor deve apenas receber o primeiro valor repassado, caso contrário, utilize o += para receber e concatenar o valor na String e formar a expressão.
      //TODO - 7: Para as teclas: C e DEL, no onPressed ao invés do setValor chame o método resetar para zerar a calculadora.
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
  //TODO - 3: Para resolver as equações com as operações disponíveis em nossa calculadora utilizaremos um pacote chamado math_expressions. Esse paco consegue pegar uma equação elaborada, como por exemplo (3+2) ou (10+5)/3 e resolvê-la. Nesse sentido,
  // crie um método chamado setarValor que receberá um parâmetro do tipo String para o valor da tecla pressionada.


  //TODO - 6: Crie um método chamado resetar para zerar a calculadora caso precise realizar outras contas.

  //TODO - 10: Crie um método chamado realizarCalculo.

  //TODO - 11: Utilizando o arquivo readme e os exemplos disponíveis na página oficial do pacote math_expressions crie uma variável que receba a nossa expressão matemática que atualmente se encontra dentro da variável mensagemVisor.

  //TODO - 12: Ainda utilizando a documentação oficial da math_expressions faça com que a expressão seja executada e que o resultado seja armazenado em uma outra variável.

  //TODO - 13: Utilizando um setState, ainda dentro do método realizarCalculo faça com que o valor da variável mensagemVisor seja atualizado para o resultado obtido através do uso da math_expressions. Você precisará converter esse resultado para String (se não souber como fazer esse tipo de conversão dê um Google xD).

  //TODO - 14: Para a tecla de divisão utilizamos o símbolo "÷", entretanto, esse símbolo não é reconhecido desta forma nas expressões matemáticas. Utilize o método replaceAll (https://api.flutter.dev/flutter/dart-core/String/replaceAll.html) para substituir o símbolo "÷" pelo "/" antes da expressão ser repassada ao math_expressions.

  //TODO - 15: Na versão mais recente do Flutter o RaisedButton foi descontinuado. Como desafio, sugiro que você atualize esse widget para a versão mais recente. Dê uma olhada no link a seguir: https://api.flutter.dev/flutter/material/RaisedButton-class.html.

  //TODO - 16: Execute o app.

  //TODO - 17: Seja feliz!

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
