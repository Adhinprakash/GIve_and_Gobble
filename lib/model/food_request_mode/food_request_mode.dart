import 'package:json_annotation/json_annotation.dart';

part 'food_request_mode.g.dart';

@JsonSerializable()
class FoodRequestModel {
  String? title;
  String? time;
  String? location;
  String? quantity;

  FoodRequestModel(
      {required this.title,
      required this.time,
      required this.location,
      required this.quantity});

  factory FoodRequestModel.fromJson(Map<String, dynamic> json) {
    return _$FoodRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FoodRequestModelToJson(this);
}
