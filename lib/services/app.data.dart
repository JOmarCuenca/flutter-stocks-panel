import 'dart:math';

import 'package:faker/faker.dart';

class AppData {
  static final AppData _singleton = AppData._internal();

  static final _faker = Faker();
  static final _rng = Random(42);

  factory AppData() {
    return _singleton;
  }

  AppData._internal();

  String get userName => _faker.person.name();

  int getNextInt([int max = 100]) => _rng.nextInt(max);

  double getNextDouble([double max = 5]) => _rng.nextDouble() * max;

  double getNextDoubleValue([double max = 5]) => _rng.nextDouble() > .5 ? getNextDouble(max) : - getNextDouble(max);
  int getNextIntValue([int max = 100]) => _rng.nextDouble() > .5 ? getNextInt(max) : - getNextInt(max);

  String getRandomCompanyName() => _faker.company.name();

  String getRandomProductName() => _faker.food.restaurant();

  DateTime getRandomDate() => DateTime(2022, getNextInt(11) + 1, getNextInt(27) + 1);
}