import 'dart:async';

class Validators {
  //<> lo q sale
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
      //sink le dice q informacion hay un error y bloquearlo
      handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  //<> lo q sale
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      //sink le dice q informacion hay un error y bloquearlo
      handleData: (password, sink) {
    //dejar fluir esta contraseña
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Mas de 6 caracteres por favor');
    }
  });
}