import 'package:flutter/material.dart';
import 'package:validation/src/bloc/login_bloc.dart';
export 'package:validation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;
//determina si se tiene q regresar la instancia o utilizar la exitente
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(
        key: key,
        child: child,
      );
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);
  final loginBloc = LoginBloc();

  //Consturctor
  //Provider({Key key, Widget child}) : super(key: key, child: child);
//actualizar y comunicar a sus hijos
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  //ocupa la intacia, regrese el estado de loginBloc
  static LoginBloc of(BuildContext context) {
    //busca internamente, y retorna el bloc
    //se va a buscar cual es la intanca del provider
    //busca provider
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
