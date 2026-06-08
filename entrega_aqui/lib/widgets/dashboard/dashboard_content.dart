// import 'package:entrega_aqui/core/constants/app_values.dart';
// import 'package:entrega_aqui/core/mock/dashboard_mock_data.dart';
// import 'package:entrega_aqui/widgets/cards/app_delivery_card.dart';
// import 'package:entrega_aqui/widgets/cards/app_stat_card.dart';
// import 'package:entrega_aqui/widgets/headers/app_section_header.dart';
// import 'package:entrega_aqui/widgets/dashboard/dashboard_greeting.dart';
// import 'package:flutter/material.dart';

// class DashboardContent extends StatelessWidget {
//   const DashboardContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           final double sidePadding = constraints.maxWidth >= 600 ? 24 : AppValues.paddingMd;

//           return ListView(
//             padding: EdgeInsets.fromLTRB(
//               sidePadding,
//               AppValues.paddingMd,
//               sidePadding,
//               AppValues.paddingLg + 88,
//             ),
//             children: <Widget>[
//               const DashboardGreeting(),
//               const SizedBox(height: 20),
//               ...DashboardMockData.stats.map(
//                 (DashboardStatMock stat) => Padding(
//                   padding: const EdgeInsets.only(bottom: 14),
//                   child: AppStatCard(stat: stat),
//                 ),
//               ),
//               const SizedBox(height: 14),
//               const AppSectionHeader(
//                 title: 'Últimas Encomendas',
//               ),
//               const SizedBox(height: 14),
//               ...DashboardMockData.recentDeliveries.map(
//                 (DashboardDeliveryMock delivery) => Padding(
//                   padding: const EdgeInsets.only(bottom: 12),
//                   child: AppDeliveryCard(delivery: delivery),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
