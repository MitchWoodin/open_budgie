import 'package:flutter/material.dart';

import '../../../core/constants/core_constants.dart';

class MobileAccountView extends StatefulWidget {
  const MobileAccountView({Key? key}) : super(key: key);

  @override
  State<MobileAccountView> createState() => _MobileAccountViewState();
}

class _MobileAccountViewState extends State<MobileAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      drawer: UIConstants.drawer(context),
      body: const Center(
        child: Text("Single Account"),
      )
    );
  }
}
