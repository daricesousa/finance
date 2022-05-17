
import 'package:financas/pages/groupPage.dart';
import 'package:financas/pages/home.dart';
import 'package:financas/pages/report-group.dart';
import 'package:financas/pages/report.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class Routes {
  static const initial = RoutesName.HOME;
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesName.HOME: (_) => Home(),
    RoutesName.GROUP: (_) => GroupPage(),
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