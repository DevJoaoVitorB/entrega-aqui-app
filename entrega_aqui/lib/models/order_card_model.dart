import 'package:flutter/material.dart';
import 'package:entrega_aqui/core/constants/app_colors.dart';

enum OrderStatus { inTransit, delivered, cancelled, waiting }

class OrderCardModel {
  const OrderCardModel({
    required this.code,
    required this.cityState,
    required this.status,
    required this.trailingInfo,
    required this.icon,
  });

  final String code;
  final String cityState;
  final OrderStatus status;
  final String trailingInfo;
  final IconData icon;

  String get statusLabel => switch (status) {
    OrderStatus.inTransit => 'EM TRÂNSITO',
    OrderStatus.delivered => 'ENTREGUE',
    OrderStatus.cancelled => 'CANCELADA',
    OrderStatus.waiting => 'AGUARDANDO',
  };

  Color get statusBgColor => switch (status) {
    OrderStatus.inTransit => AppColors.darkBlue,
    OrderStatus.delivered => AppColors.darkGreen,
    OrderStatus.cancelled => AppColors.darkRed,
    OrderStatus.waiting => AppColors.darkYellow,
  };

  Color get statusColor => switch (status) {
    OrderStatus.inTransit => AppColors.lightBlue,
    OrderStatus.delivered => AppColors.lightGreen,
    OrderStatus.cancelled => AppColors.lightRed,
    OrderStatus.waiting => AppColors.lightYellow,
  };
}
