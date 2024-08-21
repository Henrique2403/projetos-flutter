import 'package:aula_03_voidcalback_function_callback/screens/create_product.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CreateProductScreen(
        onPress: (){
          print("funfou");
        },
        onPressString: (value) {
          print(value);
        }
      ),
    );
  }
}
