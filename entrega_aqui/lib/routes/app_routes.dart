import 'package:go_router/go_router.dart';

// Telas para Roteamento
import 'package:entrega_aqui/screens/dashboard_screen.dart';
import 'package:entrega_aqui/screens/order_register_screen.dart';
import 'package:entrega_aqui/screens/tracking_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String dashboard = '/';
  static const String registerOrder = '/register-order';
  static const String tracking = '/tracking';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.dashboard,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (_, _) => const DashboardScreen(),
    ),
    GoRoute(
      path: AppRoutes.registerOrder,
      builder: (_, _) => const OrderRegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.tracking,
      builder: (_, _) => const TrackingScreen(),
    ),
  ],
);
