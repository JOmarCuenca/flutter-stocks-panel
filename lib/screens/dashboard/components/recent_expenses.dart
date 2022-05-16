import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/RecentExpenses.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmvvm/views/stateless.view.dart';

import '../../../constants.dart';

class RecentExpenses extends StatelessView<MenuControllerViewModel> {
  const RecentExpenses({
    Key? key,
  }) : super(key: key);

  @override
  Widget render(BuildContext context, MenuControllerViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Expenses",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Product Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Amount"),
                ),
              ],
              rows: List.generate(
                viewModel.currentExpenses.length,
                (index) => recentFileDataRow(viewModel.currentExpenses[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentExpense expense) {
  return DataRow(
    cells: [
      DataCell(
        Flexible(child: Text(expense.name,))
      ),
      DataCell(Text(DateFormat.yMd().format(expense.date))),
      DataCell(Text("\$ ${expense.amount.toStringAsFixed(2)}")),
    ],
  );
}
