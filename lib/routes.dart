
import 'package:financas/pages/expenses-page.dart';
import 'package:financas/pages/groups-page.dart';
import 'package:financas/pages/report-expenses.dart';
import 'package:financas/pages/report-groups.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class Routes {
  static const initial = RoutesName.HOME;
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesName.HOME: (_) => GroupsPage(),
    RoutesName.GROUP: (_) => ExpensesPage(),
    RoutesName.REPORT_GROUP: (_)=> ReportGroup(),
    RoutesName.REPORT: (_)=> Report()
  };
}

class RoutesName {
  static const HOME = '/home';
  static const GROUP = '/group';
  static const REPORT = '/report';
  static const REPORT_GROUP = '/reportgroup';
}