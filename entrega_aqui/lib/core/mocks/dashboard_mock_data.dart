import 'package:flutter/material.dart';

// Configs
import 'package:entrega_aqui/core/constants/app_colors.dart';

// Modelos Base
import 'package:entrega_aqui/models/order_card_model.dart';
import 'package:entrega_aqui/models/stat_card_model.dart';

class DashboardMockData {
  DashboardMockData._();

  static const String username = 'João Silva';

  static final List<StatCardModel> stats = <StatCardModel>[
    StatCardModel(
      label: 'Total Encomendas',
      value: '124',
      icon: Icons.inventory_2_outlined,
      iconColor: AppColors.darkBlue,
      backgroundColor: AppColors.lightBlue,
      accentColor: AppColors.lightBlue,
    ),
    StatCardModel(
      label: 'Total Fretes',
      value: 'R\$ 12.450',
      icon: Icons.payments_outlined,
      iconColor: AppColors.darkYellow,
      backgroundColor: AppColors.lightYellow,
      accentColor: AppColors.lightYellow,
    ),
  ];

  static final List<OrderCardModel> recentOrders = <OrderCardModel>[
    OrderCardModel(
      code: '#TRK-882190',
      cityState: 'Campinas, SP',
      status: OrderStatus.inTransit,
      trailingInfo: 'Hoje, 14:20',
      icon: Icons.local_shipping_outlined,
    ),
    OrderCardModel(
      code: '#TRK-771024',
      cityState: 'Rio de Janeiro, RJ',
      status: OrderStatus.delivered,
      trailingInfo: 'Ontem, 16:45',
      icon: Icons.check_circle_outline,
    ),
    OrderCardModel(
      code: '#TRK-990312',
      cityState: 'Contagem, MG',
      status: OrderStatus.cancelled,
      trailingInfo: '11 Jun, 11:00',
      icon: Icons.cancel_outlined,
    ),
    OrderCardModel(
      code: '#TRK-123456',
      cityState: 'Fortaleza, CE',
      status: OrderStatus.waiting,
      trailingInfo: '12 Jun, 16:30',
      icon: Icons.access_time_outlined,
    ),
    OrderCardModel(
      code: '#TRK-882190',
      cityState: 'Porto Alegre, RS',
      status: OrderStatus.inTransit,
      trailingInfo: '13 Jun, 08:15',
      icon: Icons.local_shipping_outlined,
    ),
  ];
}
