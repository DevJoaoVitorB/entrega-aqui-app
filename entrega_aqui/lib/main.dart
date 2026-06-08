import 'package:entrega_aqui/core/theme/app_theme.dart';
import 'package:entrega_aqui/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');
  runApp(const EntregaAquiApp());
}

class EntregaAquiApp extends StatelessWidget {
  const EntregaAquiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Entrega Aqui',
      theme: AppTheme.light,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
