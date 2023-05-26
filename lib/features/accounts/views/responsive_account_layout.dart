import 'package:budgie_finance/features/accounts/views/account_view.dart';
import 'package:budgie_finance/features/accounts/views/mobile_account_view.dart';
import 'package:flutter/material.dart';

class ResponsiveAccountLayout extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const ResponsiveAccountLayout(
          mobileScaffold: null,
          desktopScaffold: null,
        ),
      );

  const ResponsiveAccountLayout({
    super.key,
    required desktopScaffold,
    required mobileScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1000) {
        return const MobileAccountView();
      } else {
        return const AccountView();
      }
    });
  }
}
