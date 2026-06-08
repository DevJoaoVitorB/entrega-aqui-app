// import 'package:entrega_aqui/core/constants/app_colors.dart';
// import 'package:entrega_aqui/core/mock/dashboard_mock_data.dart';
// import 'package:flutter/material.dart';

// class AppStatCard extends StatelessWidget {
//   const AppStatCard({super.key, required this.stat});

//   final DashboardStatMock stat;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         border: Border(
//           left: BorderSide(color: stat.accentColor, width: 4),
//         ),
//         boxShadow: const <BoxShadow>[
//           BoxShadow(
//             color: Color(0x12000000),
//             blurRadius: 18,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   stat.label,
//                   style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                         color: AppColors.textSecondary,
//                         fontWeight: FontWeight.w700,
//                       ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   stat.value,
//                   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                         color: AppColors.primary,
//                         fontWeight: FontWeight.w800,
//                       ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 46,
//             height: 46,
//             decoration: BoxDecoration(
//               color: stat.backgroundColor,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Icon(stat.icon, color: stat.iconColor, size: 26),
//           ),
//         ],
//       ),
//     );
//   }
// }