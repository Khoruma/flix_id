import 'package:flutter/material.dart';

import '../../../misc/methods.dart';
import '../../../widgets/seat.dart';

Widget legend() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Seat(size: 20, status: SeatStatus.available),
        horizontalSpaces(5),
        const Text('Available', style: TextStyle(fontSize: 12)),
        horizontalSpaces(10),
        const Seat(size: 20, status: SeatStatus.selected),
        horizontalSpaces(5),
        const Text('Selected', style: TextStyle(fontSize: 12)),
        horizontalSpaces(10),
        const Seat(size: 20, status: SeatStatus.unavailable),
        horizontalSpaces(5),
        const Text('Reserved', style: TextStyle(fontSize: 12)),
        horizontalSpaces(10),
      ],
    );
