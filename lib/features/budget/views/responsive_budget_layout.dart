import 'package:budgie_finance/features/budget/views/budget_view.dart';
import 'package:budgie_finance/features/budget/views/mobile_budget_view.dart';
import 'package:flutter/material.dart';

class ResponsiveBudgetLayout extends StatelessWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const ResponsiveBudgetLayout(
      mobileScaffold: null,
      desktopScaffold: null,
    ),
  );

  const ResponsiveBudgetLayout({
    super.key,
    required desktopScaffold,
    required mobileScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1000) {
        return const MobileBudgetView();
      } else {
        return const BudgetView();
      }
    });
  }
}
