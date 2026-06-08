import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/core/constants/app_values.dart';

// Rotas Mapeadas
import 'package:entrega_aqui/routes/app_routes.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key, required this.selectedIndex});

  final int selectedIndex;

  static const List<_NavItemData> _items = <_NavItemData>[
    _NavItemData(
      label: 'Início',
      icon: Icons.grid_view_rounded,
      route: AppRoutes.dashboard,
    ),
    _NavItemData(
      label: 'Novo',
      icon: Icons.add_box_outlined,
      route: AppRoutes.registerOrder,
    ),
    _NavItemData(
      label: 'Rastrear',
      icon: Icons.local_shipping_outlined,
      route: AppRoutes.tracking,
    ),
  ];

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items
            .map(
              (_NavItemData item) => _NavItem(
                data: item,
                selected: _items.indexOf(item) == selectedIndex,
                onTap: () => context.go(item.route),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NavItemData {
  const _NavItemData({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.data,
    required this.selected,
    required this.onTap,
  });

  final _NavItemData data;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = selected
        ? AppColors.textPrimary
        : AppColors.textSecondary;
    final Color backgroundColor = selected
        ? AppColors.lightYellow
        : AppColors.transparent;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: selected ? AppSpacing.lg : AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(data.icon, color: foregroundColor, size: AppIconSize.md),
            const SizedBox(height: 2),
            Text(
              data.label,
              style: TextStyle(
                color: foregroundColor,
                fontSize: AppFontSize.md,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
