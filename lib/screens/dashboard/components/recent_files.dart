import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/RecentStock.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmvvm/views/stateless.view.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessView<MenuControllerViewModel> {
  const RecentFiles({
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
            "Recent Transactions",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Company Name"),
                ),
                DataColumn(
                  label: Text("Date"),
                ),
                DataColumn(
                  label: Text("Amount"),
                ),
                DataColumn(
                  label: Text("Delta"),
                ),
              ],
              rows: List.generate(
                viewModel.currentStocks.length,
                (index) => recentFileDataRow(viewModel.currentStocks[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentStock fileInfo) {
  final color = fileInfo.delta > 0 ? Colors.green : Colors.red;
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Icon(fileInfo.delta > 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: color,),
            SizedBox(width: 5,),
            Flexible(child: Text(fileInfo.title,))
          ],
        )
      ),
      DataCell(Text(DateFormat.yMd().format(fileInfo.date))),
      DataCell(Text("\$ ${fileInfo.amount.toStringAsFixed(2)}")),
      DataCell(Text("\$ ${fileInfo.delta.toStringAsFixed(2)}", style: TextStyle(color: color),)),
    ],
  );
}
