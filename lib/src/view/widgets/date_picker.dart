// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:parking_manager/src/controller/parking_slot_controller.dart';

// class DatePicker extends ConsumerWidget {
//   final String label;
//   final int parkingSlotNumber;
//   const DatePicker({required this.parkingSlotNumber, super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final parkingRecord = ref.read(parkingSlotControllerProvider.notifier).getParkingRecordByParkSLNUM(ref, parkingSlotNumber);

//     return InkWell(
//       onTap: onTap,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 label,
//               ),
//               Text(
//                 DateFormat('dd/MM/yyyy').format(date),
//               ),
//               Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.primary),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
