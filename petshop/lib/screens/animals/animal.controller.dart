import 'package:get/get.dart';
import '../../database/app.database.dart';
import '../../domain/animal.dart';

class AnimalController extends GetxController {
  final Rx<bool> _status = Rx(false);
  AnimalDataBase animalDataBase = AnimalDataBase.instance;

  AnimalController();

  saveAnimal(Animal value) async {
    await animalDataBase.insert(value);
    _status.value = true;
  }
}