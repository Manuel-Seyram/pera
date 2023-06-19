import 'dart:async';
import 'package:pera/models/national%20id/ghana_card_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../../helpers/ghana_card_color.dart';

class GhanaCardListBloc {
  final BehaviorSubject<List<GhanaCardResults>> _ghanacardsCollection =
      BehaviorSubject<List<GhanaCardResults>>();

  List<GhanaCardResults> _ghanacardResults;

  //Retrieve data from Stream
  Stream<List<GhanaCardResults>> get ghanacardList =>
      _ghanacardsCollection.stream;

  void initialData() async {
    var initialData = await rootBundle.loadString('data/initialData.json');
    var decodedJson = jsonDecode(initialData);
    _ghanacardResults = GhanaCardModel.fromJson(decodedJson).ghanacardresults;
    for (var i = 0; i < _ghanacardResults.length; i++) {
      _ghanacardResults[i].ghanacardColor = GhanaCardColor.baseColors[i];
    }
    _ghanacardsCollection.sink.add(_ghanacardResults);
  }

  GhanaCardListBloc(this._ghanacardResults) {
    initialData();
  }

  void addGhanaCardToList(GhanaCardResults newCard) {
    _ghanacardResults.add(newCard);
    _ghanacardsCollection.sink.add(_ghanacardResults);
  }

  void dispose() {
    _ghanacardsCollection.close();
  }
}

final ghanacardListBloc = GhanaCardListBloc([]);
