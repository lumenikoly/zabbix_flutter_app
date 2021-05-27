import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:zabbix_flutter_app/core/usecases/usecase.dart';
import 'package:zabbix_flutter_app/features/domain/entities/pet.dart';
import 'package:zabbix_flutter_app/features/domain/repositories/repository.dart';
import 'package:dartz/dartz.dart';

///Класс варианта использования просмотра всех питомцев
class GetAllPets extends UseCase<List<Pet>, NoParams> {
  final Repository petsRepository;

  GetAllPets(this.petsRepository);

  @override
  Future<Either<Failure, List<Pet>>> call(NoParams params) async {
    return await petsRepository.getAllPets();
  }
}
