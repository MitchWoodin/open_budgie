import 'package:budgie_finance/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UIConstants.appBar(),
        body: Row(children: [
          UIConstants.drawer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Row(children: [
              Text("Hello"),
              SizedBox(width: 10),
              Text("World"),
            ]),
          )
        ]));
  }
}
