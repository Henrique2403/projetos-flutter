import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/tip.controller.dart';
import 'register_tip.screen.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  late TipController _tipController;

  @override
  void initState() {
    _tipController = TipController();
    _tipController.fetchTips();
    super.initState();
  }

  Future<void> _navigateToRegisterTipScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterTipScreen()),
    );

    if (result == true) {
      // Atualiza a lista se a dica foi cadastrada com sucesso
      _tipController.fetchTips();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Dicas")),
      body: Obx(() {
        if (_tipController.loading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_tipController.tips.value.isEmpty) {
          return const Center(
            child: Text('Nenhuma dica disponível'),
          );
        }

        return ListView.builder(
          itemCount: _tipController.tips.value.length,
          itemBuilder: (BuildContext context, int index) {
            final tip = _tipController.tips.value[index];
            return ListTile(
              title: Text(tip.title),
              subtitle: Text(tip.category),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _navigateToRegisterTipScreen(context),
      ),
    );
  }
}