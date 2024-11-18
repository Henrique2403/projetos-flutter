import 'package:get/get.dart';
import '../../domain/tips.dart';
import '../../services/request.service.dart';

class TipController extends GetxController {
  final _requestService = RequestService();
  Rx<List<Tip>> tips = Rx([]);
  Rx<bool> loading = Rx(false);

  TipController();

  Future<void> fetchTips() async {
    loading.value = true;
    tips.value = await _requestService.readTipsService();
    loading.value = false;
  }

  Future<bool> createTip({
    required String category,
    required String title,
    required String student,
    required String description,
  }) async {
    final tip = Tip(
      category: category,
      title: title,
      student: student,
      description: description,
    );
    return await _requestService.createTipService(tip);
  }
}
