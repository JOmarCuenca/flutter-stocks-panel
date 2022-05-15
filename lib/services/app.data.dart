import 'package:faker/faker.dart';

class AppData {
  static final AppData _singleton = AppData._internal();

  static final _faker = Faker();

  factory AppData() {
    return _singleton;
  }

  AppData._internal();

  String get userName => _faker.person.name();
}