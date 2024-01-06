import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({super.key});

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 290.0,
          height: 48.0,
          decoration: BoxDecoration(
            border: Border.all(color: MainColor.searchBoxBorderColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: TextField(
            controller: searchController,
            keyboardType: TextInputType.name,
            style: GoogleFonts.montserrat(
              color: MainColor.searchBoxFontColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: UnconstrainedBox(
                child: SvgPicture.asset(
                  'assets/svg/search_icon.svg',
                  width: 24.0,
                  height: 24.0,
                ),
              ),
              hintText: 'Search Location ...',
              hintStyle: GoogleFonts.montserrat(
                color: MainColor.searchBoxFontColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                borderSide: BorderSide(
                  width: 0.0,
                  color: MainColor.searchBoxBorderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                borderSide: BorderSide(
                  width: 0.0,
                  color: MainColor.searchBoxBorderColor,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 48.0,
          height: 48.0,
          decoration: BoxDecoration(
            gradient: MainGradientColor.searchIconGradient,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/plus_icon.svg',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      ],
    );
  }
}
