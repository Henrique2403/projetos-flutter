import 'package:flutter/material.dart';

import '../domain/fruit.dart';
import '../snnipets.dart';

class FruitCreateScreen extends StatefulWidget {
  final Function(Fruit) onPress;

  const FruitCreateScreen({super.key, required this.onPress});

  @override
  State<FruitCreateScreen> createState() => _FruitCreateState();
}

class _FruitCreateState extends State<FruitCreateScreen> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Fruta"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: inputDecoration(label: "Informe o nome"),
          ),
          TextField(
            controller: _priceController,
            decoration: inputDecoration(label: "Informe o preço"),
          ),
          ElevatedButton(
              onPressed: () {
                widget.onPress(Fruit(
                  name: _nameController.text,
                  price: double.parse(_priceController.text),
                ));
              },
              child: const Text("Salvar"))
        ],
      ),
    );
  }
}
