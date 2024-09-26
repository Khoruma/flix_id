import 'package:flutter/material.dart';

import '../../../misc/constants.dart';

Widget movieScreen() => Container(
      height: 50,
      width: 250,
      margin: const EdgeInsets.only(top: 24, bottom: 10),
      decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: saffron, width: 3),
          ),
          gradient: LinearGradient(
            colors: [saffron.withOpacity(0.33), Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
    );
