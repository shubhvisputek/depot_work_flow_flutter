// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  // static const ROOT = _Paths.ROOT;

  static const HOME = _Paths.HOME;

  static const INVENTORY = _Paths.HOME + _Paths.INVENTORY;

  static const TICKETS = _Paths.HOME + _Paths.TICKETS;
  static const TICKET = TICKETS + _Paths.TICKET;
  static const DEVICE = TICKET + _Paths.DEVICE;
  static const DEVICE_COMPLETION = DEVICE + _Paths.DEVICE_COMPLETION;

  static const LOGIN = _Paths.LOGIN;
  static const SETTINGS = _Paths.SETTINGS;
  static const UNKNOWN = _Paths.UNKNOWN;

  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String TICKET_DETAILS(String ticketId) => '$TICKETS/$ticketId';
  static String DEVICE_DETAILS(String deviceId) => '$DEVICE/$deviceId';
}

abstract class _Paths {
  // static const ROOT = RootView.routeName;
  static const LOGIN = "/"; // LoginView.routeName;
  static const HOME = HomeView.routeName;
  static const TICKETS = TicketsView.routeName;
  static const TICKET = TicketView.routeName;
  static const DEVICE = DeviceView.routeName;
  static const DEVICE_COMPLETION = DeviceCompletionView.routeName;
  static const INVENTORY = InventoryView.routeName;
  static const SETTINGS = SettingsView.routeName;
  static const UNKNOWN = UnknownRouteView.routeName;
}
