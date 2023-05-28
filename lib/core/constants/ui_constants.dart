import 'package:budgie_finance/features/accounts/views/responsive_account_layout.dart';
import 'package:budgie_finance/features/budget/views/responsive_budget_layout.dart';
import 'package:flutter/material.dart';

import '../theme/core_theme.dart';
import '../widgets/drawer_list_tile_button.dart';
import 'core_constants.dart';

class UIConstants {
  static AppBar appBar(darkMode) {
    return AppBar(
      automaticallyImplyLeading: darkMode,
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
      backgroundColor: Palette.primaryVariant,
      elevation: 0,
    );
  }

  static Drawer drawer(BuildContext context) {
    return Drawer(
      backgroundColor: Palette.primaryVariant,
      elevation: 0,
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
                Navigator.push(
                  context,
                  ResponsiveBudgetLayout.route(),
                );
              }),
          ExpansionTile(
            title: const Text("Accounts"),
            leading: const Icon(Icons.account_balance),
            children: [
              DrawerListTileButton(
                title: "Income",
                onTap: () {
                  Navigator.push(
                    context,
                    ResponsiveAccountLayout.route(),
                  );
                },
              )
            ],
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
