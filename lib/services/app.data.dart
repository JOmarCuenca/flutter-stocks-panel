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
}