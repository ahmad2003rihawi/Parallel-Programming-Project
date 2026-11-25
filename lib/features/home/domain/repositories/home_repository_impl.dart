import 'package:booking_system_ui/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/home_item_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeItemEntity>>> getHomeItems({
    String city = 'Riyadh',
  });
}
