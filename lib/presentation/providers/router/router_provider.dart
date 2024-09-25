import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/entities/transaction.dart';
import '../../pages/detail_page/detail_page.dart';
import '../../pages/login_page/login_page.dart';
import '../../pages/main_page/main_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../pages/register_page/register_page.dart';
import '../../pages/seat_booking_page/seat_booking_page.dart';
import '../../pages/time_booking_page/time_booking_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
            path: '/main',
            name: 'main',
            builder: (context, state) => const MainPage()),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => RegisterPage(),
        ),
        GoRoute(
          path: '/detail',
          name: 'detail',
          builder: (context, state) => DetailPage(
            movie: state.extra as Movie,
          ),
        ),
        GoRoute(
          path: '/time-booking',
          name: 'time-booking',
          builder: (context, state) => TimeBookingPage(
            state.extra as MovieDetail,
          ),
        ),
        GoRoute(
          path: '/seat-booking',
          name: 'seat-booking',
          builder: (context, state) => SeatBookingPage(
            transactionDetail: state.extra as (MovieDetail, Transaction),
          ),
        ),
      ],
      initialLocation: '/login',
      debugLogDiagnostics: false,
    );
