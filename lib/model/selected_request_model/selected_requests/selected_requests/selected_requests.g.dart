// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectedRequests _$SelectedRequestsFromJson(Map<String, dynamic> json) =>
    SelectedRequests(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      quantity: json['quantity'] as int?,
      time: json['time'] as String?,
      location: json['location'] as String?,
      userRole: json['userRole'] as String?,
      isAccepted: json['isAccepted'] as bool?,
      status: json['status'] as String?,
      image: json['image'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$SelectedRequestsToJson(SelectedRequests instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'quantity': instance.quantity,
      'time': instance.time,
      'location': instance.location,
      'userRole': instance.userRole,
      'isAccepted': instance.isAccepted,
      'status': instance.status,
      'image': instance.image,
      '__v': instance.v,
    };
