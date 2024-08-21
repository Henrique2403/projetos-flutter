import 'package:aula_03_voidcalback_function_callback/snnipets/snnipets.dart';
import 'package:flutter/material.dart';

class CreateProductScreen extends StatefulWidget {
  final VoidCallback onPress;
  final Function(String) onPressString;

  const CreateProductScreen({super.key, required this.onPress, required this.onPressString});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  late TextEditingController _name;
  late TextEditingController _quantity;

  @override
  void initState() {
    _name = TextEditingController();
    _quantity = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar produtos"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _name,
            decoration: inputDecoration,
          ),
          SizedBox(height: 20,),
          TextField(
            controller: _quantity,
            decoration: inputDecoration,
          ),
          ElevatedButton(
            onPressed: (){
              widget.onPressString(_name.text);
            },
            child: Text("Enviar"),
          )
        ],
      ),
    );
  }
}
