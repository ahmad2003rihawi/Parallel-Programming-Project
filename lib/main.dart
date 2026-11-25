import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/routing/app_router.dart';
import 'core/styles/app_theme.dart';
// import 'generated/local_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I.isRegistered<AppRouter>()
        ? GetIt.I<AppRouter>()
        : AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // onGenerateTitle: (context) => LocaleKeys.app_title.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      theme: AppTheme.lightTheme,

      // darkTheme: AppTheme.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
