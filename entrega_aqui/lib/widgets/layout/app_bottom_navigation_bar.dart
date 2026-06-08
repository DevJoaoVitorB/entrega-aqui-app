import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/core/constants/app_values.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.lg,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _NavItem(label: 'Início', icon: Icons.grid_view_rounded),
          _NavItem(label: 'Novo', icon: Icons.add_box_outlined),
          _NavItem(label: 'Rastrear', icon: Icons.local_shipping_outlined),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final AppBottomNavigationBar parent = context
        .findAncestorWidgetOfExactType<AppBottomNavigationBar>()!;
    final bool selected = parent.selectedIndex == _indexForLabel(label);
    final Color foregroundColor = selected
        ? AppColors.primary
        : const Color(0xFF4E5563);
    final Color backgroundColor = selected
        ? const Color(0xFFFFC107)
        : Colors.transparent;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: selected ? 18 : 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, color: foregroundColor, size: 26),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 12,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  int _indexForLabel(String label) {
    switch (label) {
      case 'Novo':
        return 1;
      case 'Rastrear':
        return 2;
      case 'Início':
      default:
        return 0;
    }
  }
}
