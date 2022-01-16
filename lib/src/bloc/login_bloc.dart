import 'dart:async';

import 'package:validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  //Behavior siempre trae el ultimo valor emitido
  final _emailContoller = BehaviorSubject<String>();
  //final _emailContoller = StreamController<String>.broadcast();
  //broadcast para q varias intancias esten esuchando
  //final _passwordContoller = StreamController<String>.broadcast();
  final _passwordContoller = BehaviorSubject<String>();

//Recuperar datos del Stream
  Stream<String> get emailStream =>
      _emailContoller.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordContoller.stream.transform(validarPassword);

  /*Stream<bool> get formValidStream =>
      //callback  a llamar cuando tengamos inf de ambos stream
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);*/
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

//Insertar valores al Stream

  Function(String) get changeEmail => _emailContoller.sink.add;
  Function(String) get changePassword => _passwordContoller.sink.add;

//Obtener el ultimo valor registrado a los stream
  String get email => _emailContoller.value;
  String get password => _passwordContoller.value;

  dispose() {
    _emailContoller?.close();
    _passwordContoller?.close();
  }
}
