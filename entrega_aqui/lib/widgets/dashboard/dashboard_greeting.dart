import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

// Saudação do dashboard. Recebe username do Provider — sem acesso direto ao mock.
class DashboardGreeting extends StatelessWidget {
  const DashboardGreeting({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Olá, $username',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Confira o status das suas entregas hoje.',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
