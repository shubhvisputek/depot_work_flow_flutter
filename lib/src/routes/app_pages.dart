import 'package:depotworkflow/src/home/home_view.dart';
import 'package:depotworkflow/src/home/tickets/tickets_view.dart';
import 'package:depotworkflow/src/login/login_view.dart';
import 'package:depotworkflow/src/settings/settings_view.dart';
import 'package:get/get.dart';

import '../home/home_binding.dart';
import '../home/inventory/inventory_binding.dart';
import '../home/inventory/inventory_view.dart';
import '../home/tickets/tickets_binding.dart';
import '../login/login_binding.dart';
import '../middleware/auth_middleware.dart';
import '../settings/settings_binding.dart';
import 'UnknownRouteView.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final unknownRoute =
      GetPage(name: UnknownRouteView.routeName, page: () => UnknownRouteView());

  static final routes = [
    GetPage(
      // middlewares: [
      //   //only enter this route when not authed
      //   EnsureNotAuthedMiddleware(),
      // ],
      name: _Paths.LOGIN,
      page: () => LoginView(),
      bindings: [LoginBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          middlewares: [
            //only enter this route when authed
            EnsureAuthMiddleware(),
          ],
          preventDuplicates: true,
          name: _Paths.HOME,
          page: () => HomeView(),
          bindings: [HomeBinding()],
          title: null,
          children: [
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.TICKETS,
              page: () => TicketsView(),
              title: 'Tickets',
              transition: Transition.zoom,
              participatesInRootNavigator: true,
              bindings: [TicketsBinding()],
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.INVENTORY,
              page: () => InventoryView(),
              title: 'Inventory',
              transition: Transition.size,
              participatesInRootNavigator: true,
              bindings: [InventoryBinding()],
            ),
          ],
        ),
        GetPage(
          middlewares: [
            //only enter this route when authed
            EnsureAuthMiddleware(),
          ],
          name: _Paths.SETTINGS,
          page: () => SettingsView(),
          bindings: [SettingsBinding()],
        ),
      ],
    ),
  ];
}
