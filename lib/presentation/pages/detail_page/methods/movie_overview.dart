import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/movie_detail.dart';
import '../../../misc/methods.dart';

List<Widget> movieOverview(AsyncValue<MovieDetail?> asyncMovieDetail) => [
      const Text(
        'Overview',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      verticalSpaces(10),
      asyncMovieDetail.when(
        data: (movieDetail) =>
            Text(movieDetail != null ? movieDetail.overview : ''),
        error: (error, stackTrace) => const Text("Failed to load overview"),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      )
    ];
