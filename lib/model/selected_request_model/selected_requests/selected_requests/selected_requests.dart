import 'package:json_annotation/json_annotation.dart';

part 'selected_requests.g.dart';

@JsonSerializable()
class SelectedRequests {
  @JsonKey(name: '_id')
  String? id;
  String? userId;
  String? title;
  int? quantity;
  String? time;
  String? location;
  String? userRole;
  bool? isAccepted;
  String? status;
  String? image;
  @JsonKey(name: '__v')
  int? v;

  SelectedRequests({
    this.id,
    this.userId,
    this.title,
    this.quantity,
    this.time,
    this.location,
    this.userRole,
    this.isAccepted,
    this.status,
    this.image,
    this.v,
  });

  factory SelectedRequests.fromJson(Map<String, dynamic> json) {
    return _$SelectedRequestsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelectedRequestsToJson(this);
}
