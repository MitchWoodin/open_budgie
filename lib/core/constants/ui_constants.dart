import 'package:budgie_finance/core/core.dart';
import 'package:flutter/material.dart';

import '../../features/accounts/views/account_page.dart';
import '../../features/budget/views/budget_view.dart';
import '../theme/core_theme.dart';
import '../widgets/drawer_list_tile_button.dart';
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
            ),
          ),
          DrawerListTileButton(
              title: "Budget",
              icon: const Icon(
                Icons.monetization_on,
                color: Palette.background,
              ),
              onTap: () {
                Navigator.push(context, BudgetView.route());
              }),
          DrawerListTileButton(
            title: "Accounts",
            icon: const Icon(
              Icons.account_balance,
              color: Palette.background,
            ),
            onTap: () {
              Navigator.push(
                context,
                AccountView.route(),
              );
            },
          ),
          ExpansionTile(
            title: const Text(
              "Settings",
              style: TextStyle(color: Palette.background),
            ),
            leading: const Icon(Icons.settings, color: Palette.background),
            children: [
              DrawerListTileButton(
                title: "Profile",
                onTap: () {},
                icon: const Icon(Icons.person, color: Palette.background),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Palette.unselected,
                ),
              ),
              // Switch(value: darkMode, onChanged: onChanged)
            ],
          ),
        ],
      ),
    );
  }
}
