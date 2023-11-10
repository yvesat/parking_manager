import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_manager/src/view/pages/registration_pages/vehicle_reg_page.dart';

import '../view/pages/parking_history_page.dart';
import '../view/pages/parking_occ_page.dart';
import '../view/pages/parking_slots_page.dart';
import '../view/pages/registration_page.dart';
import '../view/pages/registration_pages/parking_slot_reg_page.dart';
import '../view/pages/root_navigation_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorParkingSlotsKey = GlobalKey<NavigatorState>(debugLabel: 'parkingSlots');
final _shellNavigatorParkingOccScreenKey = GlobalKey<NavigatorState>(debugLabel: 'parkingOccpancy');
final _shellNavigatorRegistrationKey = GlobalKey<NavigatorState>(debugLabel: 'registration');
final _shellNavigatorParkingHistoryKey = GlobalKey<NavigatorState>(debugLabel: 'parkingHistory');

final router = GoRouter(
  initialLocation: '/parkingSlots',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return RootNavigationPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorParkingSlotsKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/parkingSlots',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ParkingSlotsPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorParkingOccScreenKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/parkingOccupancy',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ParkingOccPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRegistrationKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/registration',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RegistrationPage(),
              ),
              routes: [
                GoRoute(
                  path: 'vehicleReg',
                  builder: (context, state) => const VehicleRegScreen(),
                ),
                GoRoute(
                  path: 'pakingSlotReg',
                  builder: (context, state) => const ParkingSlotRegScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorParkingHistoryKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/history',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ParkingHistoryPage(),
              ),
            ),
          ],
        ),
      ],
    )
  ],
);
