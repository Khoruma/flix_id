import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../domain/entities/movie.dart';
import '../../../widgets/network_image_card.dart';

List<Widget> movieList({
  required String title,
  void Function(Movie movie)? onTap,
  required AsyncValue<List<Movie>> movies,
}) =>
    [
      Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 15),
        child: Text(
          title,
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ),
      SizedBox(
        height: 228,
        child: movies.when(
          data: (data) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data
                  .asMap()
                  .entries
                  .map((entry) => Padding(
                        padding: EdgeInsets.only(
                          left:
                              entry.key == 0 ? 24 : 10, // Compare index instead
                          right: entry.key == data.length - 1 ? 24 : 0,
                        ),
                        child: NetworkImageCard(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500${entry.value.posterPath}',
                          fit: BoxFit.contain,
                          onTap: () => onTap?.call(entry.value),
                        ),
                      ))
                  .toList(),
            ),
          ),
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    ];
