import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/vehicle_controller.dart';
import '../../widgets/alert.dart';

class VehicleRegPage extends ConsumerStatefulWidget {
  const VehicleRegPage({Key? key}) : super(key: key);

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

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Cadastro de Veículos'),
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
                TextFormField(
                  controller: _brandController,
                  decoration: InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.industry,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelText: 'Marca',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a marca';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _modelController,
                  decoration: InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.car,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelText: 'Modelo',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o modelo';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _licensePlateController,
                  decoration: InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.circleInfo,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelText: 'Placa',
                  ),
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
                      await vehicleController.createVehicle(context, ref, _brandController.text, _modelController.text, _licensePlateController.text.toUpperCase());

                      _brandController.clear();
                      _modelController.clear();
                      _licensePlateController.clear();
                    } else {
                      alert.snack(context, "Favor preencher todos os dados.");
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text('Salvar Veículo'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    //TODO: Verificar se há alterações pendentes
    return true;
  }
}
