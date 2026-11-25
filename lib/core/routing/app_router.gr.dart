// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:booking_system_ui/core/layout/main_shell_screen.dart' as _i3;
import 'package:booking_system_ui/features/auth/presentation/screens/auth_screen.dart'
    as _i1;
import 'package:booking_system_ui/features/home/presentation/screens/home_screen.dart'
    as _i2;
import 'package:booking_system_ui/features/my_account/presentation/screens/my_account_screen.dart'
    as _i4;
import 'package:booking_system_ui/features/my_bookings/presentation/screens/my_bookings_screen.dart'
    as _i5;
import 'package:booking_system_ui/features/my_favorites/presentation/screens/my_favorites_screen.dart'
    as _i6;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.MainShellScreen]
class MainShellRoute extends _i7.PageRouteInfo<void> {
  const MainShellRoute({List<_i7.PageRouteInfo>? children})
    : super(MainShellRoute.name, initialChildren: children);

  static const String name = 'MainShellRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.MainShellScreen();
    },
  );
}

/// generated route for
/// [_i4.MyAccountScreen]
class MyAccountRoute extends _i7.PageRouteInfo<void> {
  const MyAccountRoute({List<_i7.PageRouteInfo>? children})
    : super(MyAccountRoute.name, initialChildren: children);

  static const String name = 'MyAccountRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.MyAccountScreen();
    },
  );
}

/// generated route for
/// [_i5.MyBookingsScreen]
class MyBookingsRoute extends _i7.PageRouteInfo<void> {
  const MyBookingsRoute({List<_i7.PageRouteInfo>? children})
    : super(MyBookingsRoute.name, initialChildren: children);

  static const String name = 'MyBookingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.MyBookingsScreen();
    },
  );
}

/// generated route for
/// [_i6.MyFavoritesScreen]
class MyFavoritesRoute extends _i7.PageRouteInfo<void> {
  const MyFavoritesRoute({List<_i7.PageRouteInfo>? children})
    : super(MyFavoritesRoute.name, initialChildren: children);

  static const String name = 'MyFavoritesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.MyFavoritesScreen();
    },
  );
}
