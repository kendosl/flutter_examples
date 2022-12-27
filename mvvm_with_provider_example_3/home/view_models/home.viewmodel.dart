import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_3/home/model/carousel.model.dart';
import 'package:mvvm_with_provider_example_3/home/respository/home_repo.dart';
import 'package:mvvm_with_provider_example_3/shared/view_models/loading.viewmodel.dart';

class HomeViewModel extends LoadingViewModel {
  HomeViewModel({
    required this.repo,
  });

  final HomeRepo repo;

  CarouselModel _homeModel = CarouselModel();
  CarouselModel get homeModel => _homeModel;

  setHomeModel(CarouselModel homeModel) {
    _homeModel = homeModel;
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      isLoading = true;

      _homeModel = await repo.fetchData();
    } catch (exc) {
      debugPrint('Error in _fetchData: ${exc.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }
}
