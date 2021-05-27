import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
///Сущность "Посетитель"
class Visitor extends Equatable {
  final int id;
  final String name;
  final int phone;

  Visitor({
    @required this.id,
    @required this.name,
    @required this.phone,
  });

  @override
  List<Object> get props => [id, name, phone];
}
