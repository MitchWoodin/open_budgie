import 'package:budgie_finance/core/constants/ui_constants.dart';
import 'package:budgie_finance/core/theme/core_theme.dart';
import 'package:flutter/material.dart';

class BudgetView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const BudgetView(),
      );

  const BudgetView({Key? key}) : super(key: key);

  @override
  State<BudgetView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      drawer: UIConstants.drawer(context),
      body: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(children: [
              Text("Budget"),
              SizedBox(width: 10),
              Text("Page"),
            ]),
          )
        ],
      ),
    );
  }
}
