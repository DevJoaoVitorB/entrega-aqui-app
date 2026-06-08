import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/core/constants/app_values.dart';
import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      decoration: const BoxDecoration(color: AppColors.primary),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Container(
              width: AppIconSize.xxl,
              height: AppIconSize.xxl,
              color: AppColors.secondary,
              child: Image.asset('assets/logo.png', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.secondary,
                fontSize: AppFontSize.xl,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ClipOval(
            child: Container(
              width: AppIconSize.xxl,
              height: AppIconSize.xxl,
              color: AppColors.secondary,
              child: Image.asset('assets/avatar_padrao.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
