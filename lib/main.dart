import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stock Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context)
                .textTheme
                .copyWith(headline3: TextStyle(color: Colors.white)))
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MVVM(
        viewModel: MenuControllerViewModel(),
        view: () => MainScreenView(),
      ),
    );
  }
}
