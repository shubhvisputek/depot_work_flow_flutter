import 'package:depotworkflow/src/home/home_view.dart';
import 'package:depotworkflow/src/home/link_to_ticket/link_to_ticket_binding.dart';
import 'package:depotworkflow/src/home/tickets/ticket/device/%20device_completion/device_completion_binding.dart';
import 'package:depotworkflow/src/home/tickets/ticket/device/%20device_completion/device_completion_view.dart';
import 'package:depotworkflow/src/home/tickets/tickets_view.dart';
import 'package:depotworkflow/src/login/login_view.dart';
import 'package:depotworkflow/src/settings/settings_view.dart';
import 'package:get/get.dart';

import '../home/home_binding.dart';
import '../home/inventory/inventory_binding.dart';
import '../home/inventory/inventory_view.dart';
import '../home/link_to_ticket/link_to_ticket_view.dart';
import '../home/tickets/ticket/device/device_binding.dart';
import '../home/tickets/ticket/device/device_view.dart';
import '../home/tickets/ticket/ticket_binding.dart';
import '../home/tickets/ticket/ticket_view.dart';
import '../home/tickets/tickets_binding.dart';
import '../login/login_binding.dart';
import '../middleware/auth_middleware.dart';
import '../settings/settings_binding.dart';
import 'UnknownRouteView.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
              children: [
                GetPage(
                  middlewares: [
                    //only enter this route when authed
                    EnsureAuthMiddleware(),
                  ],
                  name: _Paths.TICKET,
                  page: () => TicketView(),
                  title: 'Ticket',
                  transition: Transition.zoom,
                  participatesInRootNavigator: true,
                  bindings: [TicketBinding()],
                  children: [
                    GetPage(
                      middlewares: [
                        //only enter this route when authed
                        EnsureAuthMiddleware(),
                      ],
                      name: _Paths.DEVICE,
                      page: () => DeviceView(),
                      title: 'Device',
                      transition: Transition.zoom,
                      participatesInRootNavigator: true,
                      bindings: [DeviceBinding()],
                      children: [
                        GetPage(
                          middlewares: [
                            //only enter this route when authed
                            EnsureAuthMiddleware(),
                          ],
                          name: _Paths.DEVICE_COMPLETION,
                          page: () => DeviceCompletionView(),
                          title: 'Device Completion',
                          transition: Transition.zoom,
                          participatesInRootNavigator: true,
                          bindings: [DeviceCompletionBinding()],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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
              children: [
                GetPage(
                  middlewares: [
                    //only enter this route when authed
                    EnsureAuthMiddleware(),
                  ],
                  name: _Paths.LINK_TO_TICKET,
                  page: () => LinkToTicketBindingView(),
                  title: 'Link To Ticket',
                  transition: Transition.zoom,
                  participatesInRootNavigator: true,
                  bindings: [LinkToTicketBinding()],
                ),
              ],
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
