import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeJsonConverter implements JsonConverter<DateTime, String> {
  const DateTimeJsonConverter();
  @override
  DateTime fromJson(String json) => DateTime.parse("0000-00-00 $json");

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
