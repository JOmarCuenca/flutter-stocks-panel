import 'package:admin/services/app.data.dart';

class RecentStock {
  final String title;
  final DateTime date;
  final double amount, delta;

  const RecentStock(this.title, this.date, this.amount, this.delta);

  factory RecentStock.genRandom() {
    final AppData appData = AppData();

    return RecentStock(
        appData.getRandomCompanyName(),
        appData.getRandomDate(),
        appData.getNextDouble(150),
        appData.getNextDoubleValue(5));
  }
}

final demoRecentStocks = List.generate(8, (index) => RecentStock.genRandom());
