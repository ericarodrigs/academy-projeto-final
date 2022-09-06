// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'w_star_rating_controller.g.dart';

class WStarRatingController = _WStarRatingController with _$WStarRatingController;

abstract class _WStarRatingController with Store{
  @observable
  double? ratingValue;

  @action
  Future<void> changeRatingValue(newRatingValue) async {
    ratingValue = newRatingValue;
  }
}