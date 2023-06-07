import 'package:flutter/material.dart';

class CardModel {
  late List<CardResults> results;

  CardModel({ required this.results});

  CardModel.fromJson(Map<String, dynamic> json) {
    if (json['cardResults'] != null) {
      results = List<CardResults>();
      json['cardResults'].forEach((v) {
        results.add(CardResults.fromJson(v));
      });
    }
  }
}

class CardResults {
  late String cardHolderName;
  late String cardNumber;
  late String cardMonth;
  late String cardYear;
  late String cardCvv;
  late Color cardColor;
  late String cardType;

   CardResults(
      {required this.cardHolderName,
      required this.cardNumber,
      required this.cardMonth,
      required this.cardYear,
      required this.cardCvv,
      required this.cardColor,
      required this.cardType});

  CardResults.fromJson(Map<String, dynamic> json) {
    cardHolderName = json['cardHolderName'];
    cardNumber = json['cardNumber'];
    cardMonth = json['cardMonth'];
    cardYear = json['cardYear'];
    cardCvv = json['cardCvv']; //Card Verification Number
    cardColor = json['cardColor'];
    cardType = json['cardType'];
  }
}
