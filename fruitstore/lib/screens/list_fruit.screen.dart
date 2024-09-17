import 'package:flutter/material.dart';

import '../snnipets.dart';
import 'controller/fruit_controller.screen.dart';
import 'fruit_create.screen.dart';

class FruitListScreen extends StatefulWidget {
  const FruitListScreen({super.key});

  @override
  State<FruitListScreen> createState() => _FruitListScreenState();
}

class _FruitListScreenState extends State<FruitListScreen> {
  late FruitController _fruitController;

  @override
  void initState() {
    _fruitController = FruitController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Frutas"),
      ),
      body: ListenableBuilder(
        listenable: _fruitController,
        builder: (BuildContext context, Widget? child) {
          return ListView.builder(
              itemCount: _fruitController.fruits.length,
              itemBuilder: (BuildContext context, int index) {
                final fruit = _fruitController.fruits[index];
                return ListTile(
                  title: Text(fruit.name),
                  subtitle: Text("Valor: ${fruit.price}"),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openRoute(
              context, FruitCreateScreen(onPress: _fruitController.addFruit));
        },
        child: const Icon(Icons.plus_one_outlined),
      ),
    );
  }
}
