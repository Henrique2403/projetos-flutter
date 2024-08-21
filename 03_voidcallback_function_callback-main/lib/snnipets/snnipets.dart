import 'package:flutter/material.dart';

OutlineInputBorder border({Color borderColor = Colors.black}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  );
}

Widget icon(IconData icon) {
  return InkWell(
    onTap: () {},
    child: Icon(icon, color: Colors.black),
  );
}

InputDecoration get inputDecoration => InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      labelText: '',
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
      prefixIcon: const Icon(Icons.ac_unit_rounded),
      suffixIcon: icon(Icons.remove_red_eye_sharp),
      focusedBorder: border(borderColor: Colors.black),
      enabledBorder: border(borderColor: Colors.black),
      disabledBorder: border(borderColor: Colors.grey),
      errorBorder: border(borderColor: Colors.red),
      focusedErrorBorder: border(borderColor: Colors.red),
      counterText: '',
    );
