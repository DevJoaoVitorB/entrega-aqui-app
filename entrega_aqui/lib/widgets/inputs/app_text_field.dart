import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/core/constants/app_values.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.width,
    required this.controller,
    this.keyboardType,
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
  });

  final String label;
  final String hintText;
  final double? width;

  final TextEditingController controller;

  final TextInputType? keyboardType;
  final bool readOnly;

  final ValueChanged<String>? onChanged;

  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final Widget field = TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.secondary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xl,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
        ),
      ),
    );

    final Widget result = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        field,
      ],
    );

    return width == null ? result : SizedBox(width: width, child: result);
  }
}
