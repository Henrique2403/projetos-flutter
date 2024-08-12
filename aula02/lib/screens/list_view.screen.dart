import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  late List<String> produtos = [];
  late List<int> quantidades = [];

  @override
  void initState() {
    produtos = ["Feijão", "Arroz", "Açúcar", "Café", "Macarrão"];
    quantidades = [1, 3, 3, 5, 2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de compras")),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(produtos[index]),
            subtitle: (Text("${quantidades[index]} Kg")),
          );
        },
      ),
    );
  }
}
