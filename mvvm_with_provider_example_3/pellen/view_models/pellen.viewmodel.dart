import 'package:flutter/material.dart';
import 'package:mvvm_with_provider_example_3/pellen/model/pellen.model.dart';
import 'package:mvvm_with_provider_example_3/pellen/respository/pellen_repo.dart';

class PellenViewModel extends ChangeNotifier {
  PellenViewModel({required this.repo});

  final PellenRepo repo;

  List<PellenModel> topSection() {
    final list = repo.topSection();
    return list;
  }

  List<PellenModel> bottomSection() {
    final list = repo.bottomSection();
    return list;
  }
}
