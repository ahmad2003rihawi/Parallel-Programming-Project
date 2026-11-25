import 'package:dio/dio.dart';
import '../models/home_item_model.dart';

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({required this.message, this.statusCode});
}

class NetworkException implements Exception {
  final String message;

  const NetworkException({
    this.message = 'تعذر الاتصال بالخادم، تحقق من الشبكة',
  });
}

abstract class HomeRemoteDataSource {
  Future<List<HomeItemModel>> searchTravelOptions({required String city});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio dio;

  const HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<HomeItemModel>> searchTravelOptions({
    required String city,
  }) async {
    try {
      final response = await dio.get(
        'api/Bookings/search',
        queryParameters: {'city': city},
      );

      final data = response.data;

      final List<dynamic> rawList;
      if (data is List) {
        rawList = data;
      } else if (data is Map<String, dynamic>) {
        final listValue = data['items'] ?? data['data'] ?? data['results'];
        rawList = listValue is List ? listValue : const [];
      } else {
        rawList = const [];
      }

      return rawList
          .whereType<Map<String, dynamic>>()
          .map(HomeItemModel.fromJson)
          .toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const NetworkException();
      }

      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;

      String message = 'حدث خطأ أثناء جلب البيانات من الخادم';
      if (responseData is Map<String, dynamic> &&
          responseData['error'] != null) {
        message = responseData['error'].toString();
      } else if (e.message != null && e.message!.isNotEmpty) {
        message = e.message!;
      }

      throw ServerException(message: message, statusCode: statusCode);
    } catch (e) {
      if (e is ServerException || e is NetworkException) rethrow;
      throw ServerException(message: 'خطأ غير متوقع أثناء معالجة البيانات: $e');
    }
  }
}
