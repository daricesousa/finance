import 'package:financas/pages/dates_page.dart';
import 'package:financas/pages/expenses_page.dart';
import 'package:financas/pages/groups_page.dart';
import 'package:financas/pages/report_expenses.dart';
import 'package:financas/pages/report_groups.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final navigator = navigatorKey.currentState!;

class Routes {
  static const initial = RoutesName.DATES;
  static Map<String, Widget Function(BuildContext)> routes = {
    RoutesName.DATES: (_) => const DatesPage(),
    RoutesName.GROUPS: (_) => const GroupsPage(),
    RoutesName.EXPENSES: (_) => const ExpensesPage(),
    RoutesName.REPORT_GROUPS: (_) => const ReportGroups(),
    RoutesName.REPORT_EXPENSES: (_) => const ReportExpenses()
  };
}

class RoutesName {
  static const DATES = '/dates';
  static const EXPENSES = '/expenses';
  static const GROUPS = '/groups';
  static const REPORT_EXPENSES = '/reportExpenses';
  static const REPORT_GROUPS = '/reportGroups';
}
