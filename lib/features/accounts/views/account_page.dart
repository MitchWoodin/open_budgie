import 'package:budgie_finance/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class AccountView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AccountView(),
  );
  const AccountView({Key? key}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UIConstants.appBar(),
        drawer: UIConstants.drawer(context),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(children: [
            Text("Account"),
            SizedBox(width: 10),
            Text("Page"),
          ]),
        ));
  }
}
