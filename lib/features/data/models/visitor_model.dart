import 'package:zabbix_flutter_app/features/domain/entities/visitor.dart';
import 'package:meta/meta.dart';

///Модель данных посетителя для засипи на событие
class VisitorModel extends Visitor {
  VisitorModel({
    @required int id,
    @required String name,
    @required int phone,
  }) : super(id: id, name: name, phone: phone);

  ///Создание Json из [VisitorModel]
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}
