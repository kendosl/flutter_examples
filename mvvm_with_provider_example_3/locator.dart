import 'package:get_it/get_it.dart';
import 'package:mvvm_with_provider_example_3/home/respository/home_repo.dart';
import 'package:mvvm_with_provider_example_3/shared/services/navigation.service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerFactory<HomeRepo>(() => HomeRepoImpl());
}
