import 'package:zabbix_flutter_app/features/domain/entities/pet.dart';
import 'package:zabbix_flutter_app/features/domain/entities/price.dart';
import 'package:meta/meta.dart';

///Модель данных питомца
class PriceModel extends Price {
  PriceModel({
    @required int price,
    @required String title,
  }) : super(price: price, title: title);

  ///Создание [PriceModel] из Json
  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      price: json['price'],
      title: json['title'],
    );
  }
}
