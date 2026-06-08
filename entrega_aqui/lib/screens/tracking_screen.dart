import 'package:flutter/material.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';

// Widgets
import 'package:entrega_aqui/widgets/layout/app_top_bar.dart';
import 'package:entrega_aqui/widgets/layout/app_bottom_navigation_bar.dart';

// Tela de rastreamento de encomendas
class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: <Widget>[
          AppTopBar(title: 'Rastrear'),
          Expanded(child: Center(child: Text('Em breve'))),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 2),
    );
  }
}
