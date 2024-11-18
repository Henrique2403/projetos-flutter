import 'package:dio/dio.dart';
import '../domain/tips.dart';

class RequestService {
  final dio = Dio();
  final host = "https://gdapp.com.br/api";

  Future<List<Tip>> readTipsService() async {
    try {
      final response = await dio.get('$host/sustainable-tips');
      return (response.data as List)
          .map((json) => Tip.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> createTipService(Tip tip) async {
    final data = {'tip': tip.toJson()};

    try {
      final response = await dio.post(
        '$host/sustainable-tips',
        data: data,
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
