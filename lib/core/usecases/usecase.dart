import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

///Абстрактный класс варианта использования
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

///Класс пустого поля параметров в варианте использования
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
