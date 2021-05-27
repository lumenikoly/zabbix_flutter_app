import 'package:data_connection_checker/data_connection_checker.dart';

///Абстрактный класс информации о интернет подключении
abstract class NetworkInfo {
  ///Возвращает true при наличии подключения и false при отсутствии
  Future<bool> get isConnected;
}

///Реализация класса информации об интернет подключении
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker _connectionChecker;

  NetworkInfoImpl(this._connectionChecker);

  ///Возвращает true при наличии подключения и false при отсутствии
  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
