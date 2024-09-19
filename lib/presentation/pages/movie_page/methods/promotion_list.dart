import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> promotionList(List<String> promotionImageFileNames) => [
      Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 15),
        child: Text(
          'Promotions',
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: promotionImageFileNames
                .map(
                  (e) => Container(
                    height: 160,
                    width: 240,
                    margin: EdgeInsets.only(
                        left: e == promotionImageFileNames.first ? 24 : 10,
                        right: e == promotionImageFileNames.last ? 24 : 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/$e'),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
                .toList()),
      ),
    ];
