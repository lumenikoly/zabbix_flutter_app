import 'package:zabbix_flutter_app/core/error/exception.dart';
import 'package:zabbix_flutter_app/features/data/models/event_model.dart';
import 'package:zabbix_flutter_app/features/data/models/pet_model.dart';
import 'package:zabbix_flutter_app/features/data/models/price_model.dart';

///Абстрактный класс локального репозитория
abstract class LocalDataSource {
  ///Получение списка [List<PetModel>] из кеша локального репозитория
  Future<List<PetModel>> getLastPetsList();

  ///Кеширование [List<PetModel>] в локальный репозиторий
  Future<void> cachePetsList(List<PetModel> allPetsListToCache);

  ///Получение списка [List<EventModel>] из кеша локального репозитория
  Future<List<EventModel>> getLastEventsList();

  ///Кеширование [List<EventModel>] в локальный репозиторий
  Future<void> cacheEventsList(List<EventModel> allEventsListToCache);

  Future<List<PriceModel>> getLastPricesList();

  Future<void> cachePrices(List<PriceModel> pricesListToCache);
}

//TODO: flutter cache manager

///Кеширует [List<PetModel>] в локальный репозиторий
///
///В случае ошибки выбрасывает ошибку [CacheException]
class LocalDataSourcesImpl implements LocalDataSource {
  @override
  Future<void> cachePetsList(List<PetModel> allPetsListToCache) {
    fuck() {}
    return fuck();
  }

  ///Кеширует данные в локальный репозиторий
  ///
  ///В случае ошибки выбрасывает ошибку [CacheException]
  @override
  Future<List<PetModel>> getLastPetsList() {
    throw CacheException();
  }

  ///Кеширует данные в локальный репозиторий
  ///
  ///В случае ошибки выбрасывает ошибку [CacheException]
  @override
  Future<void> cacheEventsList(List<EventModel> allEventsListToCache) {
    throw UnimplementedError();
  }

  ///Кеширует [List<EventModel>] в локальный репозиторий
  ///
  ///В случае ошибки выбрасывает ошибку [CacheException]

  static EventModel event1 = new EventModel(
      id: 1,
      title: "Событие 1",
      description: "Описание 1",
      imageUrl: "imgurl",
      date: "23.11.2020",
      numberOfSeats: '25');

  static EventModel event2 = new EventModel(
      id: 2,
      title: "Событие 2",
      description: "Описание 2",
      imageUrl: "imgurl",
      date: "23.11.2020",
      numberOfSeats: '25');

  static List<EventModel> eventList = [event1, event2];
  static Future<List<EventModel>> testList = Future.value(eventList);

  @override
  Future<List<EventModel>> getLastEventsList() {
    return testList;
  }

  @override
  Future<List<PriceModel>> getLastPricesList() {
    // TODO: implement getLastPriceList
    throw UnimplementedError();
  }

  @override
  Future<void> cachePrices(List<PriceModel> pricesListToCache) {
    // TODO: implement cachePrices
    throw UnimplementedError();
  }
}
