import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/my_expenses.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/dashboard/components/recent_expenses.dart';
import 'package:admin/screens/dashboard/components/savings.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
import 'components/savings_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            MenuControllerViewHeader(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MySavings(),
                      SizedBox(height: defaultPadding),
                      MyTransactions(),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                      SizedBox(height: defaultPadding),
                      MyExpenses(),
                      SizedBox(height: defaultPadding),
                      RecentExpenses(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) SavingsDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: SavingsDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
