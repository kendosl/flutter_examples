import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_3/fringilla/repository/fringilla_repo.dart';
import 'package:mvvm_with_provider_example_3/fringilla/view_models/fringilla.viewmodel.dart';
import 'package:mvvm_with_provider_example_3/home/respository/home_repo.dart';
import 'package:mvvm_with_provider_example_3/home/view_models/home.viewmodel.dart';
import 'package:mvvm_with_provider_example_3/locator.dart';
import 'package:mvvm_with_provider_example_3/pellen/respository/pellen_repo.dart';
import 'package:mvvm_with_provider_example_3/pellen/view_models/pellen.viewmodel.dart';
import 'package:mvvm_with_provider_example_3/shared/routes/routes.dart';
import 'package:mvvm_with_provider_example_3/shared/services/navigation.service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(repo: locator<HomeRepo>()),
        ),
        ChangeNotifierProvider.value(
          value: PellenViewModel(repo: locator<PellenRepo>()),
        ),
        ChangeNotifierProvider(
          create: (_) => FringillaViewModel(repo: locator<FringillaRepo>()),
        ),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final navigatorService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorService.rootNavKey,
      title: 'Screener',
      onGenerateRoute: AppRoutes.generateRoute,
      theme: AppTheme.theme,
    );
  }
}
