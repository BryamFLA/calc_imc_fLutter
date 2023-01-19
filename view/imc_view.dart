import 'package:flutter/material.dart';
import 'package:imc_calc/calculadora.dart';
import 'package:imc_calc/view/edit_text_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late CalculadoraIMC calcIMC = CalculadoraIMC();

  String valueAlt = '';
  String valuePs = '';

  String valueResult = '';
  String typeResult = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(80, 180, 200, 1),
            Color.fromRGBO(127, 0, 254, 1)
          ])),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 100),
                    child: Text(
                      'CALCULADORA IMC',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  EditText(
                    labelText: 'ALTURA EM METROS',
                    onChanged: (text) => valueAlt = text,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: EditText(
                      labelText: 'PESO EM KILOS',
                      onChanged: (text) => valuePs = text,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        shape: const StadiumBorder(),
                        foregroundColor: Colors.white,
                        side: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      setState(() {
                        try {
                          calcIMC.setValues(valueAlt, valuePs);
                          valueResult = calcIMC.calcularValueIMC();
                          typeResult = calcIMC.calcularTypeIMC();
                        } catch (e) {
                          valueResult = 'VALOR';
                          typeResult = 'INVALIDO';
                        }
                      });
                    },
                    child: const Text(
                      '    CALCULAR    ',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 10),
                    child: Text(
                      valueResult,
                      style: const TextStyle(color: Colors.white, fontSize: 80),
                    ),
                  ),
                  Text(typeResult,
                      style: const TextStyle(color: Colors.white, fontSize: 20))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
