import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String labelText;
  final void Function(String text) onChanged;

  const EditText({required this.labelText, super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.white, fontSize: 15),
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(200, 40, 40, 40)),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(20))),
    );
  }
}
