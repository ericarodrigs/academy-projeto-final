import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WPlayListOptions extends StatelessWidget {
  const WPlayListOptions({
    Key? key,
    required this.isLogged,
    required this.onAllVideos,
    required this.onHistoryVideos,
    required this.onFavoriteVideos,
    required this.onPublicVideos,
    required this.onClassVideos,
    required this.onWeekVideos,
  }) : super(key: key);

  final bool isLogged;
  final VoidCallback onAllVideos;
  final VoidCallback onHistoryVideos;
  final VoidCallback onFavoriteVideos;
  final VoidCallback onPublicVideos;
  final VoidCallback onClassVideos;
  final VoidCallback onWeekVideos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.home,
            color: AppColors.purple,
          ),
          title: const Text('Home'),
          onTap: onAllVideos,
        ),
        Visibility(
          visible: isLogged,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.history,
                  color: AppColors.purple,
                ),
                title: const Text('Últimos vistos'),
                onTap: onHistoryVideos,
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: AppColors.purple,
                ),
                title: const Text('Favoritos'),
                onTap: onFavoriteVideos,
              ),
              ListTile(
                leading: const Icon(
                  Icons.public,
                  color: AppColors.purple,
                ),
                title: const Text('Públicos'),
                onTap: onPublicVideos,
              ),
              ListTile(
                leading: const Icon(
                  Icons.class_,
                  color: AppColors.purple,
                ),
                title: const Text('Minha Turma'),
                onTap: onClassVideos,
              ),
              ListTile(
                leading: const Icon(
                  Icons.calendar_month,
                  color: AppColors.purple,
                ),
                title: const Text('Semanas'),
                onTap: onWeekVideos,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
