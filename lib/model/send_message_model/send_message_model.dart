import 'dart:convert';

SendMessageModel sendMessageModelFromJson(String str) => SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) => json.encode(data.toJson());

class SendMessageModel {
    NewMessage newMessage;

    SendMessageModel({
        required this.newMessage,
    });

    factory SendMessageModel.fromJson(Map<String, dynamic> json) => SendMessageModel(
        newMessage: NewMessage.fromJson(json["newMessage"]),
    );

    Map<String, dynamic> toJson() => {
        "newMessage": newMessage.toJson(),
    };
}

class NewMessage {
    Sender sender;
    String content;
    String id;
    DateTime time;
    int v;

    NewMessage({
        required this.sender,
        required this.content,
        required this.id,
        required this.time,
        required this.v,
    });

    factory NewMessage.fromJson(Map<String, dynamic> json) => NewMessage(
        sender: Sender.fromJson(json["sender"]),
        content: json["content"],
        id: json["_id"],
        time: DateTime.parse(json["time"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "sender": sender.toJson(),
        "content": content,
        "_id": id,
        "time": time.toIso8601String(),
        "__v": v,
    };
}

class Sender {
    String id;
    String username;
    String email;
    String profile;

    Sender({
        required this.id,
        required this.username,
        required this.email,
        required this.profile,
    });

    factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "profile": profile,
    };
}
