import 'package:mvvm_with_provider_example_3/fringilla/model/fringilla.model.dart';
import 'package:mvvm_with_provider_example_3/fringilla/repository/fringilla_repo.dart';
import 'package:mvvm_with_provider_example_3/shared/view_models/loading.viewmodel.dart';

class FringillaViewModel extends LoadingViewModel {
  FringillaViewModel({required this.repo});

  final FringillaRepo repo;

  FringillaModel _model = FringillaModel();

  FringillaModel get model => _model;

  Future<void> fetchData() async {
    try {
      isLoading = true;

      model = await repo.fetchData();
    } catch (exc) {
      // debugPrint('Error in _fetchData: ${exc.toString()');
    }

    isLoading = false;
  }

  set model(FringillaModel model) {
    _model = model;
    notifyListeners();
  }
}
