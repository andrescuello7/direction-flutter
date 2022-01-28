import 'package:flutter/material.dart';

import 'k_colors.dart';

bottomContainerShadow() => BoxShadow(
    color: Color(0x40666666),
    spreadRadius: -1,
    blurRadius: 5,
    offset: Offset(0, -1));

topContainerShadow() => BoxShadow(
    color: Color(0x40666666),
    spreadRadius: 2,
    blurRadius: 5,
    offset: Offset(0, 1));

centerContainerShadow() => BoxShadow(
    color: Color(0x40666666),
    spreadRadius: -1,
    blurRadius: 5,
    offset: Offset(0, 0));

topContainerOrangeShadow() => BoxShadow(
      color: KPrimary.withOpacity(0.2),
      spreadRadius: -5,
      blurRadius: 5,
      offset: Offset(0, 4),
    );

customGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 0.5, 1],
    colors: [
      KLightBlue_L1,
      KLightBlue,
      KLightBlue,
    ],
  );
}
