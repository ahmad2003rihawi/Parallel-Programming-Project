import '../../domain/entities/home_item_entity.dart';

enum HomeStatus { initial, loading, loaded, empty, error }

class HomeState {
  final HomeStatus status;
  final List<HomeItemEntity> items;
  final String currentCity;
  final String? errorMessage;
  final bool isRefreshing;

  const HomeState({
    this.status = HomeStatus.initial,
    this.items = const [],
    this.currentCity = 'Riyadh',
    this.errorMessage,
    this.isRefreshing = false,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<HomeItemEntity>? items,
    String? currentCity,
    String? errorMessage,
    bool? isRefreshing,
  }) {
    return HomeState(
      status: status ?? this.status,
      items: items ?? this.items,
      currentCity: currentCity ?? this.currentCity,
      errorMessage: errorMessage,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}
