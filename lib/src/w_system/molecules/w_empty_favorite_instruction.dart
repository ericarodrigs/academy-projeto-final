import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_dot_text.dart';

class WEmptyFavoriteInstruction extends StatelessWidget {
  const WEmptyFavoriteInstruction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.purple, width: 1),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Parece que você ainda tem nenhuma aula favorita.',
                style: TextStyles.black16w700Urbanist,
                textAlign: TextAlign.center,
              ),
            ),
            const Text(
              'Veja como é fácil:',
              style: TextStyles.black14BoldUrbanist,
            ),
            const WDotText(text: 'Clique em qualquer video.'),
            Column(
              children: [
                const WDotText(
                  text: 'Na pagina de detalhes clique em',
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Favoritar:',
                      style: TextStyles.black14BoldUrbanist,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.favorite, color: AppColors.favorite)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                'Pronto quando você voltar ele ja vai aparecer por aqui!!',
                style: TextStyles.black14BoldUrbanist,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
