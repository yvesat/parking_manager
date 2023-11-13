import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/parking_slot_controller.dart';
import '../../controller/vehicle_controller.dart';
import '../../model/vehicle_model.dart';
import '../widgets/car_text_form_field.dart';

class ParkingSlotControlPage extends ConsumerStatefulWidget {
  final int parkingSlotNumber;
  const ParkingSlotControlPage(this.parkingSlotNumber, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParkingSlotControlPageState();
}

class _ParkingSlotControlPageState extends ConsumerState<ParkingSlotControlPage> {
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _licensePlateController = TextEditingController();
  String _displayStringForOption(VehicleModel option) => "${option.brand} ${option.model} - ${option.licensePlate}";

  @override
  Widget build(BuildContext context) {
    final parkingSlotController = ref.read(parkingSlotControllerProvider.notifier);
    final parkingSlotState = parkingSlotController.getParkingSlot(ref, widget.parkingSlotNumber);
    final vehicleState = ref.read(vehicleControllerProvider.notifier).getVehicleState(ref);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Controle da Vaga ${widget.parkingSlotNumber.toString()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vaga ${parkingSlotState!.available ? "Disponível" : "Ocupada"}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: parkingSlotState.available ? Colors.green : Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Registrar ${parkingSlotState.available ? "entrada" : "saída"} do veículo?",
              ),
            ),
            if (parkingSlotState.available)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Autocomplete<VehicleModel>(
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<VehicleModel>.empty();
                    }
                    return vehicleState.where((VehicleModel option) {
                      return option.licensePlate.contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (VehicleModel selection) {
                    setState(() {
                      _brandController.text = selection.brand;
                      _modelController.text = selection.model;
                      _licensePlateController.text = selection.licensePlate;
                    });
                  },
                ),
              ),
            CarTextFormField(enabled: false, textController: _brandController, icon: FontAwesomeIcons.industry, label: 'Marca'),
            CarTextFormField(enabled: false, textController: _modelController, icon: FontAwesomeIcons.car, label: 'Modelo'),
            CarTextFormField(enabled: false, textController: _licensePlateController, icon: FontAwesomeIcons.circleInfo, label: 'Placa'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(parkingSlotState.available ? 'Registrar Entrada' : 'Registrar Saída'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
