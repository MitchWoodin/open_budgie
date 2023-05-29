import 'package:budgie_finance/core/constants/ui_constants.dart';
import 'package:budgie_finance/core/theme/core_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:budgie_finance/features/accounts/controller/transaction_controller.dart';
import 'package:flutter/material.dart';

class AccountView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AccountView(),
      );

  const AccountView({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends ConsumerState<AccountView> {
  final dateController = TextEditingController();
  final paidToController = TextEditingController();
  final categoryController = TextEditingController();
  final paymentController = TextEditingController();
  final depositController = TextEditingController();

  void addTransaction() {
    ref.read(transactionControllerProvider.notifier).addTransaction(
          email: "test@email.com",
          date: dateController.text,
          account: "Income",
          paidTo: paidToController.text,
          category: categoryController.text,
          payment: paymentController.text.isEmpty
              ? 0.0
              : double.parse(paymentController.text),
          deposit: depositController.text.isEmpty
              ? 0.0
              : double.parse(depositController.text),
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar(false),
      body: Row(
        children: [
          const MainDrawer(),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child:
                        Text("Income", style: TextStyle(fontSize: 20))),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                DataTable(columns: const [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Paid To')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Payment')),
                  DataColumn(label: Text('Deposit')),
                ], rows: [
                  DataRow(cells: [
                    DataCell(TextField(
                      controller: dateController,
                      decoration: const InputDecoration.collapsed(
                          hintText: "dd/mm/yyyy"),
                    )),
                    DataCell(TextField(
                      controller: paidToController,
                      decoration:
                          const InputDecoration.collapsed(hintText: "Paid To"),
                    )),
                    DataCell(TextField(
                      controller: categoryController,
                      decoration:
                          const InputDecoration.collapsed(hintText: "Category"),
                    )),
                    DataCell(TextField(
                        controller: paymentController,
                        decoration: const InputDecoration.collapsed(
                          hintText: '0.00',
                        ))),
                    DataCell(TextField(
                        controller: depositController,
                        decoration: const InputDecoration.collapsed(
                          hintText: '0.00',
                        )))
                  ])
                ]),
                IconButton(
                  onPressed: addTransaction,
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
          ),
        ],
      ),
    );
  }
}
