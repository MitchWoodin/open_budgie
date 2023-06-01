import 'dart:math';

import 'package:budgie_finance/features/accounts/views/responsive_account_layout.dart';
import 'package:budgie_finance/features/accounts/widgets/transaction_list.dart';
import 'package:budgie_finance/features/budget/views/responsive_budget_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/controller/auth_controller.dart';
import '../theme/core_theme.dart';
import '../widgets/drawer_list_tile_button.dart';
import 'core_constants.dart';

class UIConstants {
  static AppBar appBar(mobileLeading) {
    return AppBar(
      automaticallyImplyLeading: mobileLeading,
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
}

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends ConsumerState<MainDrawer> {
  @override
  Widget build(BuildContext context) {
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
          DrawerListTileButton(
            title: "Charts",
            icon: const Icon(
              Icons.pie_chart,
              color: Palette.background,
            ),
            onTap: () {
              Navigator.push(
                context,
                const TransactionList() as Route<Object?>,
              );
            },
          ),
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
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.dark_mode_outlined,
                    color: Palette.unselected,
                  )),
              IconButton(
                onPressed: () {
                  ref
                      .read(authControllerProvider.notifier)
                      .logout(context: context);
                },
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
