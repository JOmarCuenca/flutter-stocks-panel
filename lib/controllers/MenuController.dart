import 'package:admin/services/app.data.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/view_model.dart';

class MenuControllerViewModel extends ViewModel {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  String get userName => AppData().userName;
}