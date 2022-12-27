import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_3/home/view/home.view.dart';

class NamedRoute {
  NamedRoute._();

  static const String home = '/';
  static const String pellen = '/pellen';
  static const String fringilla = '/fringilla';
}

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoute.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );
      case NamedRoute.pellen:
        return MaterialPageRoute(
          builder: (context) => const PellenView(),
          settings: settings,
        );
      case NamedRoute.fringilla:
        return MaterialPageRoute(
          builder: (context) => const FringillaView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
            builder: (context) => _UndefinedView(name: settings.name),
            settings: settings);
    }
  }
}

class _UndefinedView extends StatelessWidget {
  const _UndefinedView({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong for $name'),
      ),
    );
  }
}
