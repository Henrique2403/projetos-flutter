import 'package:flutter/material.dart';
import '../controller/tip.controller.dart';

class RegisterTipScreen extends StatefulWidget {
  const RegisterTipScreen({super.key});

  @override
  State<RegisterTipScreen> createState() => _RegisterTipScreenState();
}

class _RegisterTipScreenState extends State<RegisterTipScreen> {
  late TipController _tipController;
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _studentController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _tipController = TipController();
    super.initState();
  }

  _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message), duration: const Duration(seconds: 3));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _clear() {
    _categoryController.clear();
    _titleController.clear();
    _studentController.clear();
    _descriptionController.clear();
  }

  _onPressed() async {
    final result = await _tipController.createTip(
      category: _categoryController.text,
      title: _titleController.text,
      student: _studentController.text,
      description: _descriptionController.text,
    );

    if (result) {
      _showSnackBar("Dica cadastrada com sucesso!");
      Navigator.pop(context, true); // Retorna um valor indicando sucesso
    } else {
      _showSnackBar("Falha ao cadastrar dica!");
    }
    _clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Dica')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Cadastro de Dica",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(controller: _categoryController, decoration: const InputDecoration(label: Text("Informe a Categoria"))),
          TextFormField(controller: _titleController, decoration: const InputDecoration(label: Text("Informe o Título"))),
          TextFormField(controller: _studentController, decoration: const InputDecoration(label: Text("Informe o Estudante"))),
          TextFormField(controller: _descriptionController, decoration: const InputDecoration(label: Text("Informe a Descrição"))),
          ElevatedButton(onPressed: _onPressed, child: const Text("Salvar"))
        ],
      ),
    );
  }
}