import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeCubit(this.getHomeDataUseCase) : super(const HomeState());

  Future<void> fetchHomeData({String? city, bool isRefresh = false}) async {
    final targetCity = (city ?? state.currentCity).trim();

    if (isRefresh) {
      emit(
        state.copyWith(
          currentCity: targetCity,
          isRefreshing: true,
          errorMessage: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
          currentCity: targetCity,
          errorMessage: null,
        ),
      );
    }

    final result = await getHomeDataUseCase(city: targetCity);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: state.items.isEmpty ? HomeStatus.error : HomeStatus.loaded,
            errorMessage: failure.message,
            isRefreshing: false,
          ),
        );
      },
      (items) {
        emit(
          state.copyWith(
            status: items.isEmpty ? HomeStatus.empty : HomeStatus.loaded,
            items: items,
            errorMessage: null,
            isRefreshing: false,
          ),
        );
      },
    );
  }

  Future<void> searchByCity(String city) async {
    await fetchHomeData(city: city, isRefresh: false);
  }
}
