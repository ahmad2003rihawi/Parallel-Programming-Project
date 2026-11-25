import 'package:booking_system_ui/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/home_item_entity.dart';
import '../repositories/home_repository_impl.dart';

class GetHomeDataUseCase {
  final HomeRepository repository;

  const GetHomeDataUseCase(this.repository);

  Future<Either<Failure, List<HomeItemEntity>>> call({String city = 'Riyadh'}) {
    return repository.getHomeItems(city: city);
  }
}
