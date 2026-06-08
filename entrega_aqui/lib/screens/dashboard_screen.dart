import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';

// Widgets
import 'package:entrega_aqui/widgets/dashboard/dashboard_content.dart';
import 'package:entrega_aqui/widgets/layout/app_top_bar.dart';
import 'package:entrega_aqui/widgets/layout/app_bottom_navigation_bar.dart';

// Estado Global
import 'package:entrega_aqui/providers/dashboard_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (_) => DashboardProvider(),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const Column(
        children: <Widget>[
          AppTopBar(title: 'Entrega Aqui'),
          Expanded(child: DashboardContent()),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigationBar(selectedIndex: 0),
    );
  }
}
