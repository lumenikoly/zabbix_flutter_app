import 'package:zabbix_flutter_app/features/domain/entities/pet.dart';
import 'package:meta/meta.dart';

///Модель данных питомца
class PetModel extends Pet {
  PetModel(
      {@required int id,
      @required String name,
      @required String description,
      @required String imageUrl})
      : super(id: id, name: name, description: description, imageUrl: imageUrl);

  ///Создание [PetModel] из Json
  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl']);
  }
}
