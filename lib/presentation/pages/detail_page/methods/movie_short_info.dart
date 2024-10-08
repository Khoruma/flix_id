import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/movie_detail.dart';
import '../../../misc/methods.dart';

List<Widget> movieShortInfo({
  required AsyncValue<MovieDetail?> asyncMovieDetail,
  required BuildContext context,
}) =>
    [
      Row(
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/duration.png'),
          ),
          horizontalSpaces(5),
          SizedBox(
            width: 95,
            child: Text(
              '${asyncMovieDetail.when(data: (movieDetail) => movieDetail != null ? movieDetail.runtime : '-', error: (error, stackTrace) => '-', loading: () => '-')} minutes',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset('assets/genre.png'),
          ),
          horizontalSpaces(5),
          SizedBox(
            width: MediaQuery.of(context).size.width -
                48 -
                95 -
                14 -
                14 -
                5 -
                5, //* 48 = total margin left & right, 95 = duration image width, 14 = gap between duration image and genre image, 5 = gap between genre image and genre text
            child: asyncMovieDetail.when(
                data: (movieDetail) {
                  String genre = movieDetail?.genres.join(', ') ??
                      '-'; //* menggabungkan list genre menjadi string dengan pemisah koma

                  return Text(
                    genre,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
                error: (error, stackTrace) => const Text('-'),
                loading: () => const Text('-')),
          )
        ],
      ),
      verticalSpaces(10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
            width: 18,
            child: Image.asset('assets/star.png'),
          ),
          horizontalSpaces(5),
          Text(
            (asyncMovieDetail.valueOrNull?.voteAverage ?? 0).toStringAsFixed(1),
          ),
        ],
      )
    ];
