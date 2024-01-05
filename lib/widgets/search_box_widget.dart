import 'package:flutter/material.dart';

import '../constants/color.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({super.key});

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 290.0,
          height: 48.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: MainColor.searchBoxBorderColor,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
        Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
            gradient: MainGradientColor.searchIconColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Center(
            child: Icon(Icons.exposure_plus_1),
          ),
        ),
      ],
    );
  }
}
