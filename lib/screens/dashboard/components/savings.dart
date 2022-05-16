import 'package:admin/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/views/stateless.view.dart';

class MySavings extends StatelessView<MenuControllerViewModel> {
  const MySavings({Key? key}) : super(key: key);

  @override
  Widget render(context, vmodel) {
    return Row(
      children: [
        Text(
          "My Savings: \$ ${vmodel.currentSavings.toStringAsFixed(2)}",
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }
}
