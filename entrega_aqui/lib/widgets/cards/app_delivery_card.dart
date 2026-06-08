// import 'package:entrega_aqui/core/constants/app_colors.dart';
// import 'package:entrega_aqui/core/mock/dashboard_mock_data.dart';
// import 'package:flutter/material.dart';

// class AppDeliveryCard extends StatelessWidget {
//   const AppDeliveryCard({super.key, required this.delivery});

//   final DashboardDeliveryMock delivery;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const <BoxShadow>[
//           BoxShadow(
//             color: Color(0x0F000000),
//             blurRadius: 16,
//             offset: Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         children: <Widget>[
//           Container(
//             width: 44,
//             height: 44,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: delivery.iconBackgroundColor,
//             ),
//             child: Icon(delivery.icon, color: delivery.iconColor, size: 24),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   delivery.code,
//                   style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                         color: AppColors.primary,
//                         fontWeight: FontWeight.w800,
//                       ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   delivery.cityState,
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: AppColors.textSecondary,
//                       ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: <Widget>[
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: delivery.statusColor,
//                   borderRadius: BorderRadius.circular(999),
//                 ),
//                 child: Text(
//                   delivery.status,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w800,
//                     letterSpacing: 0.2,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 delivery.trailingInfo,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                       color: AppColors.textSecondary,
//                     ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }