import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable{
  AuthenticationEvent([List ls=const[]]):super(ls);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  // final String token;

  // LoggedIn({ this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

class GotoDashboardEvent extends AuthenticationEvent {
  @override
  String toString() => 'GotoDashboardEvent';
}

