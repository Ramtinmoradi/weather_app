import 'package:flutter/material.dart';
import 'package:weather_app/widgets/search_box_widget.dart';

import '/constants/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          child: Column(
            children: <Widget>[
              SearchBoxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
