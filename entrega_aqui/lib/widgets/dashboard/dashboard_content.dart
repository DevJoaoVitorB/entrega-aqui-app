import 'package:entrega_aqui/core/constants/app_colors.dart';
import 'package:entrega_aqui/models/order_card_model.dart';
import 'package:entrega_aqui/models/stat_card_model.dart';
import 'package:entrega_aqui/providers/dashboard_provider.dart';
import 'package:entrega_aqui/widgets/dashboard/dashboard_greeting.dart';
import 'package:entrega_aqui/widgets/cards/app_delivery_card.dart';
import 'package:entrega_aqui/widgets/cards/app_stat_card.dart';
import 'package:entrega_aqui/widgets/headers/app_section_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double sidePadding = constraints.maxWidth >= 600 ? 24 : 16;

          return Consumer<DashboardProvider>(
            builder:
                (BuildContext context, DashboardProvider provider, Widget? _) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return RefreshIndicator(
                    onRefresh: provider.refresh,
                    color: AppColors.primary,
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(
                        sidePadding,
                        16,
                        sidePadding,
                        104,
                      ),
                      children: <Widget>[
                        DashboardGreeting(username: provider.username),
                        const SizedBox(height: 20),
                        ...provider.stats.map(
                          (StatCardModel stat) => Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: AppStatCard(stat: stat),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const AppSectionHeader(
                          title: 'Últimas Encomendas',
                          actionLabel: 'Ver Tudo',
                        ),
                        const SizedBox(height: 14),
                        ...provider.recentOrders.map(
                          (OrderCardModel order) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: AppDeliveryCard(order: order),
                          ),
                        ),
                      ],
                    ),
                  );
                },
          );
        },
      ),
    );
  }
}
