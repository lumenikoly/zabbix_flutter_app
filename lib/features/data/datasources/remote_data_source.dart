import 'dart:convert';
import 'dart:developer';
import 'package:zabbix_flutter_app/core/error/exception.dart';
import 'package:zabbix_flutter_app/features/data/models/event_model.dart';
import 'package:zabbix_flutter_app/features/data/models/pet_model.dart';
import 'package:zabbix_flutter_app/features/data/models/visitor_model.dart';
import 'package:zabbix_flutter_app/features/domain/entities/price.dart';
import 'package:zabbix_flutter_app/features/domain/entities/user.dart';
import 'package:zabbix_flutter_app/features/domain/entities/visitor.dart';
import 'package:zabbix_flutter_app/global.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

///Абстрактный класс удалённого репозитория

abstract class RemoteDataSource {
  ///Получение [PetsList]
  Future<List<PetModel>> getAllPets();

  ///Отправка данных [Visitor] для регистрации пользователя
  Future<String> getAuthKey(User user);

  Future<List<EventModel>> getAllEvents();

  Future<List<Price>> getPrices();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  final String _url = GlobalParams.zabbixUrl;

  RemoteDataSourceImpl({@required this.client});

  ///Делает get запрос к серверу
  ///
  ///В случае успеха возвращает [PetsList], в случае ошибки [ServerException]
  @override
  Future<List<PetModel>> getAllPets() async {
    final fakejson = await rootBundle.loadString('test/fixtures/pet.json');
    print(fakejson);
    final List<dynamic> j = json.decode(fakejson);
    List<PetModel> petsList;
    petsList = j.map((i) => PetModel.fromJson(i)).toList();
    return petsList;
    /* final response = await client.get(
      _url,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return PetsListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    } */
  }

  ///Делает post запрос к серверу
  ///
  ///Передаёт [Visitor], возвращает [Response]
  @override
  Future<String> getAuthKey(User user) async {
    String login = user.getName();
    String pass = user.getPass();
    GlobalParams.zabbixUrl = user.getUrl();
    String url = GlobalParams.zabbixUrl;

    var body = json.encode({
      'jsonrpc': '2.0',
      'method': 'user.login',
      'params': {'user': login, 'password': pass},
      'id': GlobalParams.requestIdConter,
      'auth': null
    });

    var response = await client.post(
      Uri.parse('$url/api_jsonrpc.php'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 202) {
      Map<String, Object> jsonResponse = jsonDecode(response.body);
      String apiKey = jsonResponse['result'];
      GlobalParams.apiKey = apiKey;
      log(apiKey);
      return apiKey;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<EventModel>> getAllEvents() {
    throw UnimplementedError();
  }

  @override
  Future<List<Price>> getPrices() {
    throw UnimplementedError();
  }
}
