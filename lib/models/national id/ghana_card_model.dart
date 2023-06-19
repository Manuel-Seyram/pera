import 'package:flutter/material.dart';

class GhanaCardModel {
  late List<GhanaCardResults> ghanacardresults;

  GhanaCardModel({required this.ghanacardresults});

  GhanaCardModel.fromJson(Map<String, dynamic> json) {
    if (json['cardResults'] != null) {
      ghanacardresults = <GhanaCardResults>[];
      json['cardResults'].forEach((v) {
        ghanacardresults.add(GhanaCardResults.fromJson(v));
      });
    }
  }
}

class GhanaCardResults {
  late String cardHolderName;
  late String idcardNumber;
  late String nationality;
  late String dob;
  late String documentNumber;
  late String placeOfIssuance;
  late String expDate;
  late String height;
  late String sex;
  late Color ghanacardColor;
  late String cardType;

  GhanaCardResults(
      {required this.cardHolderName,
      required this.idcardNumber,
      required this.nationality,
      required this.dob,
      required this.documentNumber,
      required this.placeOfIssuance,
      required this.expDate,
      required this.height,
      required this.sex,
      required this.ghanacardColor,
      required this.cardType});

  GhanaCardResults.fromJson(Map<String, dynamic> json) {
    cardHolderName = json['cardHolderName'];
    idcardNumber = json['idcardNumber'];
    nationality = json['nationality'];
    dob = json['dob'];
    documentNumber = json['documentNumber']; //Card Verification Number
    placeOfIssuance = json['placeOfIssuance'];
    expDate = json['expDate'];
    height = json['height'];
    sex = json['sex'];
    ghanacardColor = json['ghanacardColor'];
    cardType = json['cardType'];
  }
}
