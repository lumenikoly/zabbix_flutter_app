part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyLoginPage extends LoginPageState {}

class LoadingLoginPage extends LoginPageState {}

class LoadedLoginPage extends LoginPageState {
  @override
  List<Object> get props => [];
}

class ErrorLoginPage extends LoginPageState {
  final String message;

  ErrorLoginPage({@required this.message});

  @override
  List<Object> get props => [message];
}
