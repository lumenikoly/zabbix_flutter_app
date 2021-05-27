import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:zabbix_flutter_app/core/usecases/usecase.dart';
import 'package:zabbix_flutter_app/features/domain/entities/price.dart';
import 'package:zabbix_flutter_app/features/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

///Класс варианта использования счётчик цен
class GetPrices extends UseCase<List<Price>, NoParams> {
  final Repository repository;

  GetPrices(this.repository);

  @override
  Future<Either<Failure, List<Price>>> call(NoParams params) async {
    return await repository.getPrices();
  }
}
