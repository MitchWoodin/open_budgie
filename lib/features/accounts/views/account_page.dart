import 'package:budgie_finance/core/constants/ui_constants.dart';
import 'package:budgie_finance/core/theme/core_theme.dart';
import 'package:budgie_finance/features/accounts/widgets/text_field_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
  List<String> countries = [
    "Australia",
    "Canada",
    "United States",
    "United Kingdom",
    "France",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(),
      drawer: UIConstants.drawer(context),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(columns: const [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Paid To')),
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Payment')),
              DataColumn(label: Text('Deposit')),
            ], rows: [
              DataRow(cells: [
                const DataCell(Text('John Doe')),
                DataCell(
                  TextFieldDropdown(
                    items: countries,
                  )
                ),
                DataCell(
                  TextFieldDropdown(
                    items: countries,
                  )
                ),
                const DataCell(TextField(
                    decoration: InputDecoration.collapsed(
                  hintText: '0.00',
                ))),
                const DataCell(TextField(
                    decoration: InputDecoration.collapsed(
                  hintText: '0.00',
                )))
              ])
            ]),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_rounded,
              color: Palette.secondary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 5,
              color: Palette.unselected,
            ),
          )
        ],
      ),
    );
  }
}

final citiesSelected = TextEditingController();
