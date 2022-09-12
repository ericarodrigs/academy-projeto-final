import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WUserAccountActions extends StatelessWidget {
  const WUserAccountActions({
    Key? key,
    required this.isLogged,
    required this.onRegister,
    required this.onLogin,
    required this.onLogout,
  }) : super(key: key);

  final bool isLogged;
  final VoidCallback onRegister;
  final VoidCallback onLogin;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: !isLogged,
          child: ListTile(
              leading: const Icon(
                Icons.add_reaction,
                color: AppColors.purple,
              ),
              title: const Text('Registrar'),
              onTap: onRegister),
        ),
        ListTile(
          leading: isLogged
              ? const Icon(
                  Icons.logout,
                  color: AppColors.purple,
                )
              : const Icon(
                  Icons.login,
                  color: AppColors.purple,
                ),
          title: Text(
            isLogged ? 'Logout' : 'Login',
          ),
          onTap: isLogged ? onLogout : onLogin,
        ),
      ],
    );
  }
}
