import 'package:flutter/material.dart';

import '../../../core/constants/core_constants.dart';

class MobileBudgetView extends StatefulWidget {
  const MobileBudgetView({Key? key}) : super(key: key);

  @override
  State<MobileBudgetView> createState() => _MobileBudgetViewState();
}

class _MobileBudgetViewState extends State<MobileBudgetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(true),
      drawer: UIConstants.drawer(context),
      body: const Center(
        child: Text("Budget Page"),
      ),
    );
  }
}
