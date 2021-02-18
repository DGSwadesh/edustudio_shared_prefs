import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable{
  AuthenticationState([List ls=const[]]):super(ls);
}

  class AuthenticationAuthenticated extends AuthenticationState {
    AuthenticationAuthenticated();

  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}




