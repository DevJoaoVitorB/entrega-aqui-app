import 'package:entrega_aqui/core/mocks/dashboard_mock_data.dart';
import 'package:entrega_aqui/models/order_card_model.dart';
import 'package:entrega_aqui/models/stat_card_model.dart';
import 'package:flutter/material.dart';

/// Gerencia o estado do dashboard.
/// TODO: substituir mock por chamadas ao DashboardService quando disponível.
class DashboardProvider extends ChangeNotifier {
  DashboardProvider() {
    _load();
  }

  bool _isLoading = true;
  String _username = '';
  List<StatCardModel> _stats = <StatCardModel>[];
  List<OrderCardModel> _recentOrders = <OrderCardModel>[];

  bool get isLoading => _isLoading;
  String get username => _username;
  List<StatCardModel> get stats => _stats;
  List<OrderCardModel> get recentOrders => _recentOrders;

  Future<void> _load() async {
    _isLoading = true;
    notifyListeners();

    // Simula latência de rede
    await Future<void>.delayed(const Duration(milliseconds: 600));

    _username = DashboardMockData.username;
    _stats = DashboardMockData.stats;
    _recentOrders = DashboardMockData.recentOrders;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() => _load();
}
