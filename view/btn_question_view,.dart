import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BtnQuestion extends StatelessWidget {
  const BtnQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: const Color.fromARGB(0, 39, 9, 9),
      shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(100)),
      child: const Text(
        '?',
        style: TextStyle(fontSize: 30),
      ),
      onPressed: () {
        _showAlertDialog(context);
      },
    );
  }
}

void _showAlertDialog(BuildContext context) {
  // configura o button
  Widget linkButton = TextButton(
    style: TextButton.styleFrom(
      foregroundColor: const Color.fromRGBO(127, 0, 254, 1),
    ),
    child: const Text(
      "LINK",
      style: TextStyle(color: Color.fromRGBO(127, 0, 254, 1)),
    ),
    onPressed: () async {
      if (await canLaunch('https://tjw8io.csb.app/')) {
        await launch('https://tjw8io.csb.app/');
      } else {
        throw 'Could not launch IMC Site';
      }
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    icon: const Icon(
      Icons.warning,
      color: Color.fromRGBO(127, 0, 254, 1),
    ),
    title: const Text('AJUDA'),
    content: const Text(
        'PARA UTILIZAR A CALCULADORA BASTA PREENCHER AS INFORMAÇÕES E CLICAR EM CALCULAR!!!\n\nO ÍNDICE DE MASSA CORPORAL (IMC), CALCULA O ÍNDICE DE OBESIDADE ATRAVÉS DA ALTURA E DO PESO.\n\nPARA SABER MAIS ACESSE O LINK.'),
    actions: [
      linkButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
