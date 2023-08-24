// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_request_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodRequestModel _$FoodRequestModelFromJson(Map<String, dynamic> json) =>
    FoodRequestModel(
      title: json['title'] as String?,
      time: json['time'] as String?,
      location: json['location'] as String?,
      quantity: json['quantity'] as String?,
    );

Map<String, dynamic> _$FoodRequestModelToJson(FoodRequestModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'time': instance.time,
      'location': instance.location,
      'quantity': instance.quantity,
    };
