import 'package:flutter/services.dart';
import 'package:mvvm_with_provider_example_3/home/model/carousel.model.dart';

abstract class HomeRepo {
  Future<CarouselModel> fetchData();
}

class HomeRepoImpl extends HomeRepo {
  @override
  Future<CarouselModel> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 1800));

    final response =
        await rootBundle.loadString('assets/data/first_screen.json');
    return carouselModelFromJson(response);
  }
}
