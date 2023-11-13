import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VehicleTextFormField extends StatelessWidget {
  final bool enabled;
  final TextEditingController textController;
  final IconData icon;
  final String label;
  final FormFieldValidator<String>? validator;
  const VehicleTextFormField({super.key, required this.enabled, required this.textController, required this.icon, required this.label, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: textController,
      decoration: InputDecoration(
        icon: SizedBox(
          width: 40,
          child: Center(
            child: FaIcon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        labelText: label,
      ),
      validator: validator,
    );
  }
}
