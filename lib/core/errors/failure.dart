class Failure {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  String toString() => 'Failure(statusCode: $statusCode, message: $message)';
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'حدث خطأ في الخادم، يرجى المحاولة لاحقاً',
    super.statusCode,
  });
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'تحقق من اتصالك بالإنترنت ثم أعد المحاولة',
    super.statusCode,
  });
}

class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'تعذر قراءة أو حفظ البيانات المحلية',
    super.statusCode,
  });
}
