import 'dart:async';
import 'package:edustudio/util/sharePreference_instance.dart';
import 'package:flutter/material.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationNotifier with ChangeNotifier {
  AuthenticationState _state;
  AuthenticationState get getAuthenticationState => _state;
  // BuildContext context;

  // DG code
  // var isLogged = false;

  void notifyStateChange(AuthenticationEvent event) async {
    
    if (event is AppStarted) {
      _state = AuthenticationLoading();
      notifyListeners();

      new Future.delayed(const Duration(seconds: 2), () {
        // if (SharePreferenceInstance.prefs == null) {
        //   sharePrefereceInstance.init();
        // }
        if (sharePrefereceInstance.isLogin() != null &&
            sharePrefereceInstance.isLogin()) {
          _state = AuthenticationAuthenticated();
          notifyListeners();
        } else
          _state = AuthenticationUnauthenticated();
        notifyListeners();
      });
    } else if (event is GotoDashboardEvent) {
      _state = AuthenticationAuthenticated();
      notifyListeners();
    } else if (event is LoggedOut) {
      _state = AuthenticationUnauthenticated();
      notifyListeners();
    } else if (event is LoggedIn) {
      _state = AuthenticationAuthenticated();
      notifyListeners();
    }
  }
}
