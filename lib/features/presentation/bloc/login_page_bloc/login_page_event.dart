part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAuthKeyEvent extends LoginPageEvent {
  final User user = new User();

  GetAuthKeyEvent(String zabbix, String user, String pass) {
    this.user.setUrl(zabbix);
    this.user.setUser(user);
    this.user.setPass(pass);
  }

  @override
  List<Object> get props => [user];
}
