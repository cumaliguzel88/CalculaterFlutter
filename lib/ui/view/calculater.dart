import 'package:endles/ui/view/bottoms.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculater extends StatefulWidget {
  const Calculater({super.key});

  @override
  State<Calculater> createState() => _CalculaterState();
}

class _CalculaterState extends State<Calculater> {
  //işlem ve kulalnıcı inoutu için iki adet değişken oluştuurcam
  var userQustion = "";
  var userAnser = "";
  //bir liste olşturdum string tuş takımı için
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "X",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 20),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQustion,
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnser,
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      //burda kullandığım terniry oparatöre dikkat önemli
                      //silme bottonu için ayar
                      if (index == 0) {
                        // 0 de Silme var
                        return Bottoms(Colors.deepPurple[50], Colors.deepPurple,
                            buttons[index], () {
                          setState(() {
                            userQustion = "";
                          });
                        });
                        //Şimdi de delete buttonun yapıcaz son yazıalnı silmek için
                      } else if (index == buttons.length - 2) {
                        return Bottoms(
                            isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                            buttons[index], () {
                          setState(() {
                            userQustion = " ";
                            userQustion = userAnser;
                          });
                        });
                      } else if (index == 1) {
                        return Bottoms(Colors.deepPurple[50], Colors.deepPurple,
                            buttons[index], () {
                          setState(() {
                            userQustion = userQustion.substring(
                                0, userQustion.length - 1);
                          });
                        });
                      } else if (index == buttons.length - 1) {
                        return Bottoms(
                            isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                            buttons[index], () {
                          setState(() {
                            equalPrees();
                          });
                        });
                      } else {
                        return Bottoms(
                            isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                            buttons[index], () {
                          setState(() {
                            userQustion += buttons[index];
                          });
                        });
                      }
                    }),
              )),
        ],
      ),
    );
  }

  //oluşturduğumujz methodun amacı bu bir oparatör mü ?
  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "+" || x == "-" || x == "X" || x == "=") {
      return true;
    }
    return false;
  }

  // Sonucları alma methodu paket yardımı ile
  void equalPrees() {
    String finalQuestion = userQustion;
    finalQuestion = finalQuestion.replaceAll("X", "*");
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnser = eval.toString();
  }
}
//ilk sorum:Neden body kısmında childern öününe widget koyuldu;
//GRİD BUİLDER ÖĞREN
//şimdi de iki adaet text koyumacam biri sonucu biride kullanıcın yazdığı gösterecek
