import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  @JsonKey(name: '_id')
  String? id;
  String? username;
  String? email;
  String? location;
  String? role;
  bool? status;
  String? profile;
  @JsonKey(name: '__v')
  int? v;

  UserDetails({
    this.id,
    this.username,
    this.email,
    this.location,
    this.role,
    this.status,
    this.profile,
    this.v,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
