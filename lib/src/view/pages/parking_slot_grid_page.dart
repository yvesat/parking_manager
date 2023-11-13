import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:parking_manager/src/controller/data_sync_controller.dart';
import 'package:parking_manager/src/view/widgets/parking_slot_grid.dart';

import '../widgets/progress.dart';

class ParkingSlotGridPage extends ConsumerStatefulWidget {
  const ParkingSlotGridPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingSlotsGridPageState();
}

class _ParkingSlotsGridPageState extends ConsumerState<ParkingSlotGridPage> {
  Future<void>? _loadedData;
  @override
  void initState() {
    super.initState();
    Future(() {
      _loadedData = ref.read(dataSyncController.notifier).loadData(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataSyncControllerState = ref.watch(dataSyncController);
    final size = MediaQuery.sizeOf(context);

    return FutureBuilder(
      future: _loadedData,
      builder: (context, snapshot) => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Controle de Vagas'),
            ),
            body: const Padding(
              padding: EdgeInsets.all(12),
              child: ParkingSlotGrid(),
            ),
          ),
          if (dataSyncControllerState.isLoading) Progress(size, message: "Carregando dados...")
        ],
      ),
    );
  }
}
