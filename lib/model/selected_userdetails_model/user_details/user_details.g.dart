// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      role: json['role'] as String?,
      status: json['status'] as bool?,
      profile: json['profile'] as String?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'location': instance.location,
      'role': instance.role,
      'status': instance.status,
      'profile': instance.profile,
      '__v': instance.v,
    };
