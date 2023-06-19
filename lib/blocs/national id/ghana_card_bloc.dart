import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../helpers/ghana_card_color.dart';
import '../../models/national id/ghana_card_color.dart';
import '../../models/national id/ghana_card_model.dart';
import '../bloc_provider.dart';
import 'ghana_card_list_bloc.dart';
import 'ghana_card_validators.dart';

class GhanaCardBloc extends GhanaCardValidators implements BlocBase {
  final BehaviorSubject<String> _cardHolderName = BehaviorSubject<String>();
  final BehaviorSubject<String> _idcardNumber = BehaviorSubject<String>();
  final BehaviorSubject<String> _nationality = BehaviorSubject<String>();
  final BehaviorSubject<String> _dob = BehaviorSubject<String>();
  final BehaviorSubject<String> _documentNumber = BehaviorSubject<String>();
  final BehaviorSubject<String> _placeOfIssuance = BehaviorSubject<String>();
  final BehaviorSubject<String> _expDate = BehaviorSubject<String>();
  final BehaviorSubject<String> _height = BehaviorSubject<String>();
  final BehaviorSubject<String> _sex = BehaviorSubject<String>();
  final BehaviorSubject<String> _cardType = BehaviorSubject<String>();
  final BehaviorSubject<int> _ghanacardColorIndexSelected =
      BehaviorSubject<int>();

  final _ghanacardsColors = BehaviorSubject<List<GhanaCardColorModel>>();

  //Add data stream
  Function(String) get changeCardHolderName => _cardHolderName.sink.add;
  Function(String) get changeidcardNumber => _idcardNumber.sink.add;
  Function(String) get changenationality => _nationality.sink.add;
  Function(String) get changedob => _dob.sink.add;
  Function(String) get changedocumentNumber => _documentNumber.sink.add;
  Function(String) get changeplaceOfIssuance => _placeOfIssuance.sink.add;
  Function(String) get changeexpDate => _expDate.sink.add;
  Function(String) get changeheight => _height.sink.add;
  Function(String) get changesex => _sex.sink.add;
  Function(String) get selectCardType => _cardType.sink.add;

  //Retrieve data from stream
  Stream<String> get cardHolderName =>
      _cardHolderName.stream.transform(validateCardHolderName);
  Stream<String> get idcardNumber =>
      _idcardNumber.stream;
  Stream<String> get nationality => _nationality.stream;
  Stream<String> get dob => _dob.stream.transform(validateDob);
  Stream<String> get documentNumber => _documentNumber.stream;
  Stream<String> get placeOfIssuance => _placeOfIssuance.stream;
  Stream<String> get expDate => _expDate.stream;
  Stream<String> get height => _height.stream;
  Stream<String> get sex => _sex.stream;
  Stream<String> get cardType => _cardType.stream;
  Stream<int> get ghanacardColorIndexSelected =>
      _ghanacardColorIndexSelected.stream;
  Stream<List<GhanaCardColorModel>> get ghanacardColorsList =>
      _ghanacardsColors.stream;
  Stream<bool> get saveghanacardValid => Rx.combineLatest9(
      cardHolderName,
      idcardNumber,
      nationality,
      dob,
      documentNumber,
      placeOfIssuance,
      expDate,
      height,
      sex,
      (ch, idn, ny, db, dn, pi, ed, ht, sx) => true);

  void saveGhanaCard() {
    final newCard = GhanaCardResults(
        cardHolderName: _cardHolderName.value,
        idcardNumber: _idcardNumber.value,
        nationality: _nationality.value,
        dob: _dob.value,
        documentNumber: _documentNumber.value,
        placeOfIssuance: _placeOfIssuance.value,
        expDate: _expDate.value,
        height: _height.value,
        sex: _sex.value,
        ghanacardColor:
            GhanaCardColor.baseColors[_ghanacardColorIndexSelected.value],
        cardType: _cardType.value);
    ghanacardListBloc.addGhanaCardToList(newCard);
  }

  void selectGhanaCardColor(int colorIndex) {
    for (var element in GhanaCardColor.ghanacardColors) {
      element.isSelected = false;
    }
    GhanaCardColor.ghanacardColors[colorIndex].isSelected = true;
    _ghanacardsColors.sink.add(GhanaCardColor.ghanacardColors);
    _ghanacardColorIndexSelected.sink.add(colorIndex);
  }

  @override
  void dispose() {
    _cardHolderName.close();
    _idcardNumber.close();
    _nationality.close();
    _dob.close();
    _documentNumber.close();
    _placeOfIssuance.close();
    _expDate.close();
    _height.close();
    _sex.close();
    _ghanacardColorIndexSelected.close();
    _cardType.close();
  }
}
