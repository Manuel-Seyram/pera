// class for the combination of the different list items created
import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildCreditCard(BuildContext context);

  Widget buildNationalCard(BuildContext context);
}
