import 'package:zabbix_flutter_app/features/domain/entities/event.dart';
import 'package:meta/meta.dart';

///Модель данных события
class EventModel extends Event {
  EventModel(
      {@required int id,
      @required String title,
      @required String description,
      @required String imageUrl,
      @required String date,
      @required String numberOfSeats})
      : super(
            id: id,
            title: title,
            description: description,
            imageUrl: imageUrl,
            date: date,
            numberOfSeats: numberOfSeats);

  ///Создание [EventModel] из Json
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        date: json["date"],
        numberOfSeats: json["numberOfSeats"]);
  }
}
