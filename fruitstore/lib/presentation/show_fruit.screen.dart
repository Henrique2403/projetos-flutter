import 'package:flutter/material.dart';

import '../domain/fruit.dart';

class ShowFruitScreen extends StatelessWidget {
  final Fruit fruit;

  const ShowFruitScreen({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Produtos")),
      body: Column(
        children: [Text(fruit.name), Text(fruit.price)],
      ),
    );
  }
}
