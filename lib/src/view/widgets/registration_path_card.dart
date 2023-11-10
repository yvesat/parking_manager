import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPathTile extends ConsumerWidget {
  final IconData icon;
  final String label;
  final String path;

  const RegistrationPathTile({required this.icon, required this.label, required this.path, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 1.5,
        child: InkWell(
          onTap: () => context.go(path),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 100,
            height: 100,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 12),
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
