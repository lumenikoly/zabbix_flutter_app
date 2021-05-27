import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Сущность "Посетитель"
class Price extends Equatable {
  final String title;
  final int price;

  Price({
    @required this.title,
    @required this.price,
  });

  @override
  List<Object> get props => [title, price];
}
