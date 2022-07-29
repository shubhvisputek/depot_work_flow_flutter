// ignore_for_file: non_constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  // static const ROOT = _Paths.ROOT;

  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.HOME + _Paths.TICKETS;
  static const PRODUCTS = _Paths.HOME + _Paths.INVENTORY;

  static const LOGIN = _Paths.LOGIN;
  static const SETTINGS = _Paths.SETTINGS;
  static const UNKNOWN = _Paths.UNKNOWN;

  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String PRODUCT_DETAILS(String productId) => '$PRODUCTS/$productId';
}

abstract class _Paths {
  // static const ROOT = RootView.routeName;
  static const LOGIN = "/"; // LoginView.routeName;
  static const HOME = HomeView.routeName;
  static const TICKETS = TicketsView.routeName;
  static const INVENTORY = InventoryView.routeName;
  static const SETTINGS = SettingsView.routeName;
  static const UNKNOWN = UnknownRouteView.routeName;
}
