import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../controller/parking_record_controllder.dart';
import '../widgets/parking_record_tile.dart';

class ParkingRecordPage extends ConsumerStatefulWidget {
  const ParkingRecordPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingRecordPageState();
}

class _ParkingRecordPageState extends ConsumerState<ParkingRecordPage> {
  DateTime _initialDate = DateTime.now();
  DateTime _finalDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final parkingRecordController = ref.read(parkingRecordControllerProvider.notifier);
    final parkingRecordState = ref.watch(parkingRecordControllerProvider.notifier).getParkingRecordsBetweenDays(ref, _initialDate, _finalDate);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Histórico'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.magnifyingGlass, size: 16),
                      SizedBox(width: 8),
                      Text("Filtrar por data"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Data da Entrada: ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  DateFormat('dd/MM/yyyy').format(_initialDate),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.primary),
                        ],
                      ),
                      onTap: () async {
                        final newDate = await parkingRecordController.setDate(context, _initialDate);
                        if (newDate != null) {
                          setState(() {
                            _initialDate = newDate;
                          });
                        }
                      },
                    ),
                  ),
                  const Divider(thickness: 1.2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Data da Saída: ",
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  DateFormat('dd/MM/yyyy').format(_finalDate),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.calendar_today, color: Theme.of(context).colorScheme.primary),
                        ],
                      ),
                      onTap: () async {
                        final newDate = await parkingRecordController.setDate(context, _finalDate);
                        if (newDate != null) {
                          setState(() {
                            _finalDate = newDate;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: parkingRecordState.length,
                itemBuilder: (context, index) => ParkingRecordTile(
                  parkingRecordId: parkingRecordState[index].parkingRecordId,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
