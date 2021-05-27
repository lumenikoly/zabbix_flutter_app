import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:zabbix_flutter_app/core/usecases/usecase.dart';
import 'package:zabbix_flutter_app/features/domain/entities/user.dart';
import 'package:zabbix_flutter_app/features/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetAuthKey extends UseCase<String, Params> {
  final Repository repository;

  GetAuthKey(this.repository);

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await repository.getAuthKey(params.user);
  }
}

class Params extends Equatable {
  final User user;

  Params(this.user);

  @override
  List<Object> get props => [user];
}
