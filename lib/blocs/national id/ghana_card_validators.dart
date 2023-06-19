import 'dart:async';

class GhanaCardValidators {
  final validateCardHolderName = StreamTransformer<String, String>.fromHandlers(
      handleData: (cardHolderName, sink) {
    RegExp('[a-zA-Z]').hasMatch(cardHolderName)
        ? sink.add(cardHolderName)
        : sink.addError('Enter a valid Name');
  });


  final validateDob = StreamTransformer<String, String>.fromHandlers(
      handleData: (dob, sink) {
    //1st Regular Expression to Validate Credit Card Number
    RegExp(r'^(?:0[1-9]|1[0-2]\d|3[01])([\/.-])(?:0[1-9]|1[012])\1(?:19|20)\d\d$')
            //2nd Regular Expression to remove white spaces
            .hasMatch(dob.replaceAll(RegExp(r'\s+\b|\b\s'), ''))
        ? sink.add(dob)
        : sink.addError('Enter a valid dob');
  });
  
}
