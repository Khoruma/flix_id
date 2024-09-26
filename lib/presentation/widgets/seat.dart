import 'package:flutter/material.dart';

import '../misc/constants.dart';

enum SeatStatus { available, unavailable, selected }

class Seat extends StatelessWidget {
  final int? number;
  final SeatStatus status;
  final double size;
  final VoidCallback? onTap;

  const Seat({
    super.key,
    this.number,
    this.status = SeatStatus.available,
    this.size = 32.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: status == SeatStatus.available
              ? Colors.white
              : status == SeatStatus.unavailable
                  ? Colors.grey
                  : saffron,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            number?.toString() ?? '',
            style: const TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
