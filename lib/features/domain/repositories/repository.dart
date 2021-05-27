import 'package:zabbix_flutter_app/core/error/failure.dart';
import 'package:zabbix_flutter_app/features/data/models/event_model.dart';
import 'package:zabbix_flutter_app/features/domain/entities/pet.dart';
import 'package:zabbix_flutter_app/features/domain/entities/price.dart';
import 'package:zabbix_flutter_app/features/domain/entities/user.dart';
import 'package:zabbix_flutter_app/features/domain/entities/visitor.dart';
import 'package:zabbix_flutter_app/features/domain/usecase/get_auth_key.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

//Абстрактный класс хранилища
abstract class Repository {
  Future<Either<Failure, List<Pet>>> getAllPets();
  Future<Either<Failure, List<Price>>> getPrices();
  Future<Either<Failure, List<EventModel>>> getAllEvents();
  Future<Either<Failure, String>> getAuthKey(User user);
}
