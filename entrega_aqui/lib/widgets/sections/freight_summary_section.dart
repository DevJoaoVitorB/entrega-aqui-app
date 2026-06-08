import 'package:flutter/material.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/core/constants/app_values.dart';

// Widgets
import 'package:entrega_aqui/widgets/cards/app_section_card.dart';

// TODO: Seção de resumo do frete com valor estimado calculado dinamicamente.
class FreightSummarySection extends StatelessWidget {
  const FreightSummarySection({super.key, required this.calculateFreight});

  final String calculateFreight;

  @override
  Widget build(BuildContext context) {
    return AppSectionCard(
      title: 'RESUMO DO FRETE',
      icon: Icons.payments_outlined,
      sizeIcon: AppIconSize.lg,
      titleColor: AppColors.darkYellow,
      accentColor: AppColors.lightYellow,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.foreground,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Valor Estimado',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppFontSize.md,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),

            Text(
              calculateFreight,
              style: const TextStyle(
                fontSize: AppFontSize.xxl,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
