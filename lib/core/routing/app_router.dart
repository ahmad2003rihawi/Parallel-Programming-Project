import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // سنضيف المسارات المولدة هنا مثل:
    // AutoRoute(page: HomeBookingRoute.page, initial: true),
    AutoRoute(page: AuthRoute.page, initial: true),
    AutoRoute(
      page: MainShellRoute.page,
      initial: false,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: MyBookingsRoute.page),
        AutoRoute(page: MyFavoritesRoute.page),
        AutoRoute(page: MyAccountRoute.page),
        // AutoRoute(page: NotificationsRoute.page),
      ],
    ),
  ];
}
