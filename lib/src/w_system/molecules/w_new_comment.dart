import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class WNewComment extends StatelessWidget {
  const WNewComment({
    Key? key,
    required this.onSend,
    required this.onEdit,
    required this.onEditCancel,
    this.isEditMode = false,
    required this.textController,
    this.commentKey,
    this.focusNode,
  }) : super(key: key);

  final VoidCallback onSend;
  final VoidCallback onEdit;
  final VoidCallback onEditCancel;
  final bool isEditMode;
  final TextEditingController textController;
  final GlobalKey<FormState>? commentKey;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Form(
            key: commentKey,
            child: WTextFormField(
              textCapitalization: TextCapitalization.sentences,
              focusNode: focusNode,
              hintText: 'Deixe seu comentário',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 4,
              contentPadding: const EdgeInsets.all(16),
              controller: textController,
              validator: Validator.validateComment,
              textInputAction: TextInputAction.done,
              suffixIcon: isEditMode
                  ? InkWell(
                      child: const Icon(
                        Icons.cancel_outlined,
                        color: AppColors.favorite,
                      ),
                      onTap: () {
                        onEditCancel();
                        FocusScope.of(context).unfocus();
                      },
                    )
                  : null,
            ),
          ),
        ),
        isEditMode
            ? IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.deepPurple,
                ),
                onPressed: () {
                  onEdit();
                  FocusScope.of(context).unfocus();
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.send_sharp,
                  color: AppColors.deepPurple,
                ),
                onPressed: () {
                  onSend();
                  FocusScope.of(context).unfocus();
                },
              ),
      ],
    );
  }
}
