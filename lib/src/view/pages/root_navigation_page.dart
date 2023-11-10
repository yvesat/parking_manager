import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RootNavigationPage extends StatelessWidget {
  const RootNavigationPage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('RootNavigationPage'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(label: 'Vagas', icon: FaIcon(FontAwesomeIcons.squareParking)),
          NavigationDestination(label: 'Controle', icon: FaIcon(FontAwesomeIcons.rightLeft)),
          NavigationDestination(label: 'Cadastro', icon: FaIcon(FontAwesomeIcons.pen)),
          NavigationDestination(label: 'Histórico', icon: FaIcon(FontAwesomeIcons.fileLines)),
        ],
        onDestinationSelected: _goBranch,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        indicatorColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}
