import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VehicleRegPage extends ConsumerStatefulWidget {
  const VehicleRegPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VehicleRegistrationPageState();
}

class _VehicleRegistrationPageState extends ConsumerState<VehicleRegPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? brand;
  String? model;
  String? licensePlate;

  @override
  Widget build(BuildContext context) {
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
                  decoration: InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.industry,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelText: 'Marca',
                  ),
                  onChanged: (value) {
                    setState(() {
                      brand = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Brand is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.car,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelText: 'Modelo',
                  ),
                  onChanged: (value) {
                    setState(() {
                      model = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Model is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: FaIcon(
                      FontAwesomeIcons.circleInfo,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    labelText: 'Placa',
                  ),
                  onChanged: (value) {
                    setState(() {
                      licensePlate = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'License Plate is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform actions when the form is valid
                      // For example, you can save the data or navigate to the next screen
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    // Add your custom logic here, e.g., show a dialog
    // Return true to allow popping, or false to prevent it.
    return true;
  }
}
