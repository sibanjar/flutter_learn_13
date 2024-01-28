import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Validator{
  final _email = BehaviorSubject<String>.seeded('@');
  final _message = BehaviorSubject<String>.seeded('');

  Stream<String> get email => _email.stream.transform(validateEmail);
  Sink<String> get sinkemail => _email.sink;

  Stream<String> get message => _message.stream.transform(validateMessage);
  Sink<String> get sinkMessage => _message.sink;

  Stream<bool> get submitValid => Rx.combineLatest2(email, message, (e, m) => true);

  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (value,sink){

    if(value.length!=1){
      isEmail(value)
          ? sink.add(value)
          : sink.addError('please enter valid email!!1');
    }
});

  final validateMessage = StreamTransformer<String, String>.fromHandlers(handleData: (value,sink){

    if(value.isNotEmpty){
      value.length>=8
          ? sink.add(value)
          : sink.addError('message should be 8 character!!!');
    }
});

static bool isEmail(String email){
  String value = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
  RegExp regExp = RegExp(value);

  return regExp.hasMatch(email);
}

}