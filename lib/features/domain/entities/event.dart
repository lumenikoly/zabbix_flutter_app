import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Сущность "События"
class Event extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String numberOfSeats;

  Event(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.date,
      @required this.numberOfSeats});

  @override
  List<Object> get props => [id, title, description, imageUrl, numberOfSeats];
}
