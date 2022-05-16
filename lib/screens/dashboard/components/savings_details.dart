import 'package:admin/controllers/MenuController.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/views/stateless.view.dart';

import '../../../constants.dart';

class SavingsDetails extends StatelessView<MenuControllerViewModel> {
  const SavingsDetails({
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
            "Savings Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(
            viewModel.totalExpense,
            viewModel.currentSavings,
            viewModel.investedSavings,
          ),
          SizedBox(height: defaultPadding),
          _InfoCard(
            "Expenses",
            Colors.red,
            (viewModel.totalExpense / MenuControllerViewModel.initialValue) * 100
          ),
          _InfoCard(
            "Savings",
            Colors.blue,
            (viewModel.currentSavings / MenuControllerViewModel.initialValue) * 100
          ),
          _InfoCard(
            "Stocks",
            Colors.green,
            (viewModel.investedSavings / MenuControllerViewModel.initialValue) * 100
          ),
        ],
      ),
    );
  }
}

class Chart extends StatelessWidget {
  final double expenses, savings, stocks;
  const Chart(
    this.expenses,
    this.savings,
    this.stocks, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              // startDegreeOffset: -90,
              sections: [
                PieChartSectionData(
                  color: Colors.red,
                  value: expenses,
                  showTitle: false,
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: savings,
                  showTitle: false,
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: stocks,
                  showTitle: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Color color;
  final String name;
  final double percentage;
  const _InfoCard(this.name, this.color, this.percentage, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            height: 20,
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            "${percentage.toStringAsFixed(1)}%",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
