import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'parking_slot_gridtile.dart';

class ParkingSlotGrid extends HookConsumerWidget {
  const ParkingSlotGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(filteredProductsProvider);
    // final productList = ref.watch(filteredProductsProvider.notifier).filterdProductsList();

    return GridView.builder(
      shrinkWrap: true,
      itemCount: 18,
      // itemCount: productList.length,
      itemBuilder: (ctx, i) => const ParkingSlotGridTile(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
    );
  }
}
