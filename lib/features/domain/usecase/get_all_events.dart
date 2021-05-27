import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:zabbix_flutter_app/core/usecases/usecase.dart';
import 'package:zabbix_flutter_app/features/data/models/event_model.dart';
import 'package:zabbix_flutter_app/features/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

///Класс варианта использования просмотр всех событий
class GetAllEvents extends UseCase<List<EventModel>, NoParams> {
  final Repository repository;

  GetAllEvents(this.repository);

  @override
  Future<Either<Failure, List<EventModel>>> call(NoParams params) async {
    return await repository.getAllEvents();
  }
}
