import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/views/index.dart';

import '../../../constants.dart';

class MyExpenses extends StatelessView<MenuControllerViewModel> {
  const MyExpenses({
    Key? key,
  }) : super(key: key, reactive: false);

  @override
  Widget render(BuildContext context, MenuControllerViewModel viewModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Expenses",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: viewModel.addExpense,
              icon: Icon(Icons.add),
              label: Text("Add New"),
            ),
          ],
        ),
      ],
    );
  }
}
