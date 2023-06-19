import 'package:flutter/material.dart';

import '../models/national id/ghana_card_color.dart';

class GhanaCardColor {
  static const baseColors = <Color>[Colors.black, Colors.orangeAccent];

  static List<GhanaCardColorModel> ghanacardColors =
      List<GhanaCardColorModel>.generate(
          baseColors.length,
          (int index) =>
              GhanaCardColorModel(isSelected: false, ghanacardColor: index));
}
