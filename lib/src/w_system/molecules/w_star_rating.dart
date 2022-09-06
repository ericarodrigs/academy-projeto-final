import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/molecules/w_star_rating_controller.dart';

class WStarRating extends StatefulWidget {
  const WStarRating({Key? key}) : super(key: key);

  @override
  State<WStarRating> createState() => _WStarRatingState();
}

class _WStarRatingState extends State<WStarRating> {
  final mobxStar = Modular.get<WStarRatingController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const Text(
                      'Avaliações',
                      style: TextStyles.black24w700Urbanist,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        mobxStar.ratingValue != null
                            ? mobxStar.ratingValue.toString()
                            : '',
                        style: TextStyles.black24w700Urbanist,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: RatingBar(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full:
                            const Icon(Icons.star, color: AppColors.deepPurple),
                        half: const Icon(
                          Icons.star_half,
                          color: AppColors.deepPurple,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: AppColors.deepPurple,
                        )),
                    onRatingUpdate: (value) {
                      mobxStar.ratingValue = value;
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
