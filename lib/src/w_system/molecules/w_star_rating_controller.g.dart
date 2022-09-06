// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'w_star_rating_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WStarRatingController on _WStarRatingController, Store {
  late final _$ratingValueAtom =
      Atom(name: '_WStarRatingController.ratingValue', context: context);

  @override
  double? get ratingValue {
    _$ratingValueAtom.reportRead();
    return super.ratingValue;
  }

  @override
  set ratingValue(double? value) {
    _$ratingValueAtom.reportWrite(value, super.ratingValue, () {
      super.ratingValue = value;
    });
  }

  late final _$changeRatingValueAsyncAction =
      AsyncAction('_WStarRatingController.changeRatingValue', context: context);

  @override
  Future<void> changeRatingValue(dynamic newRatingValue) {
    return _$changeRatingValueAsyncAction
        .run(() => super.changeRatingValue(newRatingValue));
  }

  @override
  String toString() {
    return '''
ratingValue: ${ratingValue}
    ''';
  }
}
