import 'package:flutter/material.dart';
import 'view/imc_view.dart';

main() {
  runApp(const AppWidget(title: 'Ola Mundo'));
}

class AppWidget extends StatelessWidget {
  final String title;
  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
