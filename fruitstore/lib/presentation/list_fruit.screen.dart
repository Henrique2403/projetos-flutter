import 'package:flutter/material.dart';
import 'package:fruitstore/datasource/fruit.mock.dart';
import 'package:fruitstore/domain/fruit.dart';
import 'package:fruitstore/presentation/show_fruit.screen.dart';
import 'package:fruitstore/snnipets.dart';

class ListFruitScreen extends StatefulWidget {
  const ListFruitScreen({super.key});

  @override
  State<ListFruitScreen> createState() => _ListFruitScreenState();
}

class _ListFruitScreenState extends State<ListFruitScreen> {
  late List<Fruit> _fruits;

  @override
  void initState() {
    _fruits = fruitMock;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de frutas")),
      body: ListView.builder(
        itemCount: _fruits.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                openRoute(context, ShowFruitScreen(fruit: _fruits[index]));
              },
              child: ListTile(
                title: Text(_fruits[index].name),
                subtitle: Text(_fruits[index].price),
              ),
            );
          }
      ),
    );
  }
}
