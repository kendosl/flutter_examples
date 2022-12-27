import 'package:mvvm_with_provider_example_3/pellen/model/pellen.model.dart';
import 'package:mvvm_with_provider_example_3/pellen/utils/strings.dart';
import 'package:mvvm_with_provider_example_3/shared/assets/image.assets.dart';

abstract class PellenRepo {
  List<PellenModel> topSection();
  List<PellenModel> bottomSection();
}

class PellenRepoImpl extends PellenRepo {
  @override
  List<PellenModel> bottomSection() {
    final list = <PellenModel>[
      PellenModel(
        ImageAssets.img300.assetName,
        [
          PellenStrings.topPt1,
          PellenStrings.topPt2,
          PellenStrings.topPt3,
        ],
      )
    ];

    return list;
  }

  @override
  List<PellenModel> topSection() {
    final list = <PellenModel>[
      PellenModel(
        ImageAssets.img300.assetName,
        [
          PellenStrings.btmPt1,
          PellenStrings.btmPt2,
          PellenStrings.btmPt3,
          PellenStrings.btmPt4,
          PellenStrings.btmPt5,
          PellenStrings.btmPt6,
          PellenStrings.btmPt7,
        ],
      ),
    ];

    return list;
  }
}
