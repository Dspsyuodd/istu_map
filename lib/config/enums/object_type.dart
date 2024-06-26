import 'package:flutter/material.dart';

enum ObjectType {
  node._('Узел', Icons.location_on),
  auditorium._('Аудитория', Icons.school),
  cabinet._('Кабинет', Icons.person),
  toilet._('Туалет', Icons.wc),
  cafe._('Кафе', Icons.dining),
  ladder._('Лестница', Icons.stairs),
  elevator._('Лифт', Icons.elevator),
  entrance._('Вход', Icons.door_front_door),
  cashRegister._('Касса', Icons.currency_ruble),
  showplace._('Достопримечаетльность', Icons.museum),
  wardrobe._('Гардероб', Icons.checkroom),
  sportArea._('Спортзал', Icons.fitness_center);

  final String name;
  final IconData iconData;
  const ObjectType._(this.name, this.iconData);
}
