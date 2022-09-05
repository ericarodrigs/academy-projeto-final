import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class WNewComment extends StatelessWidget {
  const WNewComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: const Text(
            'Comentários',
            style: TextStyles.black24w700Urbanist,
          ),
        ),
        Row(
          children: [
            const Expanded(
              child: WTextFormField(
                  hintText: 'Deixe seu comentário',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 4,
                  contentPadding: EdgeInsets.all(16)),
            ),
            IconButton(
              icon: const Icon(
                Icons.send_sharp,
                color: AppColors.deepPurple,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
