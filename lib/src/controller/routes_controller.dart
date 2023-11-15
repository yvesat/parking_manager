import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/pages/parking_record_page.dart';
import '../view/pages/parking_slot_grid_page.dart';
import '../view/pages/registration_pages/parking_slot_reg_page.dart';
import '../view/pages/root_navigation_page.dart';
import '../view/pages/vehicle_list_page.dart';

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
            GoRoute(
              path: '/parkingSlots',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ParkingSlotGridPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorParkingOccScreenKey,
          routes: [
            GoRoute(
              path: '/parkingSlotReg',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ParkingSlotRegPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRegistrationKey,
          routes: [
            GoRoute(
              path: '/vehicleList',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: VehicleListPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorParkingHistoryKey,
          routes: [
            GoRoute(
              path: '/history',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ParkingRecordPage(),
              ),
            ),
          ],
        ),
      ],
    )
  ],
);
