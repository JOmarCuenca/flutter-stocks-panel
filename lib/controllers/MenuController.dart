import 'dart:developer';

import 'package:admin/models/RecentExpenses.dart';
import 'package:admin/models/RecentStock.dart';
import 'package:admin/services/app.data.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/view_model.dart';

class MenuControllerViewModel extends ViewModel {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final List<RecentStock> currentStocks = List.from(demoRecentStocks);
  final List<RecentExpense> currentExpenses = List.from(demoRecentExpenses);

  static const initialValue = 1400;

  @override
  void init() {
    super.init();
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  String get userName => AppData().userName;

  void addExpense() {
    currentExpenses.add(RecentExpense.getRandom());
    notifyListeners();
  }

  void addStock() {
    currentStocks.add(RecentStock.genRandom());
    log("Added Stock");
    notifyListeners();
  }

  double get investedSavings => currentStocks
      .map((e) => e.amount + e.delta)
      .reduce((value, element) => value + element);

  double get totalExpense => currentExpenses
      .map((e) => e.amount)
      .reduce((value, element) => value + element);

  double get currentSavings => initialValue - investedSavings - totalExpense;

  double get totalAmount => initialValue + investedSavings + totalExpense;
}
