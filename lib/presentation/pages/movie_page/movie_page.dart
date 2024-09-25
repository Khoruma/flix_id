import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../misc/methods.dart';
import '../../providers/movie/now_playing_provider.dart';
import '../../providers/movie/upcoming_provider.dart';
import '../../providers/router/router_provider.dart';
import 'methods/movie_list.dart';
import 'methods/promotion_list.dart';
import 'methods/search_bar.dart';
import 'methods/user_info.dart';

class MoviePage extends ConsumerWidget {
  final List<String> promotionImageFileNames = ['popcorn.jpg', 'buy1get1.jpg'];

  MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            verticalSpaces(40),
            searchBar(context),
            verticalSpaces(24),
            ...movieList(
              title: 'Now Playing',
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie) {
                ref.watch(routerProvider).pushNamed('detail', extra: movie);
              },
            ),
            verticalSpaces(30),
            ...promotionList(promotionImageFileNames),
            verticalSpaces(30),
            ...movieList(
              title: 'Upcoming',
              movies: ref.watch(upComingProvider),
              onTap: (movie) {
                // TODO: Goto Movie Detail Page
              },
            ),
            verticalSpaces(100),
          ],
        )
      ],
    );
  }
}
