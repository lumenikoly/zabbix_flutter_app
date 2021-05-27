import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
///Сущность "Питомец"
class Pet extends Equatable {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Pet(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.imageUrl});

  @override
  List<Object> get props => [id, name, description, imageUrl];
}
