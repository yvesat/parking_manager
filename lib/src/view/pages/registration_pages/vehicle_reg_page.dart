import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/vehicle_controller.dart';
import '../../widgets/alert.dart';
import '../../widgets/vehicle_text_form_field.dart';

class VehicleRegPage extends ConsumerStatefulWidget {
  final int? vehicleId;
  const VehicleRegPage({this.vehicleId, Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VehicleRegPageState();
}

class _VehicleRegPageState extends ConsumerState<VehicleRegPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Alert alert = Alert();
    final vehicleController = ref.read(vehicleControllerProvider.notifier);
    final vehicleState = vehicleController.getVehicle(ref, widget.vehicleId);

    if (widget.vehicleId != null) {
      setState(() {
        _brandController.text = vehicleState!.brand;
        _modelController.text = vehicleState.model;
        _licensePlateController.text = vehicleState.licensePlate;
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.vehicleId != null ? 'Editar Veículo' : 'Cadastro de Veículos'),
        actions: [
          IconButton(
            onPressed: () async => await vehicleController.removeVehicle(context, ref, vehicleState!),
            icon: const FaIcon(FontAwesomeIcons.trash),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  "Insira os dados do veículo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              VehicleTextFormField(
                enabled: true,
                textController: _brandController,
                icon: FontAwesomeIcons.industry,
                label: 'Marca',
                capitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a marca';
                  }
                  return null;
                },
              ),
              VehicleTextFormField(
                enabled: true,
                textController: _modelController,
                icon: FontAwesomeIcons.car,
                label: 'Modelo',
                capitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o modelo';
                  }
                  return null;
                },
              ),
              VehicleTextFormField(
                enabled: true,
                textController: _licensePlateController,
                icon: FontAwesomeIcons.circleInfo,
                label: 'Placa',
                capitalization: TextCapitalization.characters,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a placa do veículo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      if (widget.vehicleId != null) {
                        await vehicleController.editVehicle(context, ref, vehicleState!, _brandController.text, _modelController.text, _licensePlateController.text);
                        if (context.mounted) context.pop();
                      } else {
                        await vehicleController.createVehicle(context, ref, _brandController.text, _modelController.text, _licensePlateController.text);
                        if (context.mounted) context.pop();
                      }
                    } catch (e) {
                      if (context.mounted) alert.snack(context, e.toString());
                    }
                  } else {
                    alert.snack(context, "Favor preencher todos os dados.");
                  }
                },
                child: SizedBox(
                  width: 200,
                  child: Center(child: Text(widget.vehicleId == null ? 'Cadastrar Veículo' : 'Salvar Alterações')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
