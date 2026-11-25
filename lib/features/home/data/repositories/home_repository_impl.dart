import 'package:booking_system_ui/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/home_item_entity.dart';
import '../../domain/repositories/home_repository_impl.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  const HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<HomeItemEntity>>> getHomeItems({
    String city = 'Riyadh',
  }) async {
    try {
      final items = await remoteDataSource.searchTravelOptions(city: city);
      return Right(items);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(ServerFailure(message: 'حدث خطأ غير متوقع: $e'));
    }
  }
}
