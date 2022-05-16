import 'package:admin/services/app.data.dart';

class RecentExpense {
  final String name;
  final DateTime date;
  final double amount;

  static int counter = 0;

  const RecentExpense(this.name, this.date, this.amount);

  factory RecentExpense.getRandom() {
    final appData = AppData();

    counter++;

    return RecentExpense(
        counter % 5 == 0
            ? appData.getRandomCompanyName()
            : appData.getRandomProductName(),
        appData.getRandomDate(),
        appData.getNextDouble(50));
  }
}

final demoRecentExpenses = List.generate(8, (index) => RecentExpense.getRandom());
