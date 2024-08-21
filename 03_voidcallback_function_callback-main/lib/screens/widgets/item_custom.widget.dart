import 'package:flutter/material.dart';

class ItemCustomWidget extends StatelessWidget {
  const ItemCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:  Row(
        children: [
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/arroz.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Feijão Carioca", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("10 Unidades",style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
            ],
          )
        ],
      ),
    );
  }
}