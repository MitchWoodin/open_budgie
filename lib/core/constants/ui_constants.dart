import 'package:flutter/material.dart';

import '../../features/accounts/views/account_page.dart';
import '../../features/budget/views/budget_view.dart';
import '../theme/core_theme.dart';
import 'core_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            AssetConstants.MAIN_LOGO,
            fit: BoxFit.cover,
            height: 50,
          ),
        ),
      ),
      backgroundColor: Palette.primary,
      elevation: 10,
    );
  }

  // final BuildContext context;
  // UIConstants({required this.context});

  static Drawer drawer(BuildContext context) {
    return Drawer(
      backgroundColor: Palette.primaryVariant,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Image.asset(
            AssetConstants.SMALL_LOGO,
            scale: 0.5,
          )),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.grey),
                SizedBox(width: 15),
                Text(
                  "Budget",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, BudgetView.route());
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.account_balance, color: Colors.grey),
                SizedBox(width: 15),
                Text(
                  "Accounts",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, AccountView.route());
            },
          ),
        ],
      ),
    );
  }
}
