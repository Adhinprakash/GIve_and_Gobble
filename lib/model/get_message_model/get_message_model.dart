import 'dart:convert';

GetMessageModel getMessageModelFromJson(String str) => GetMessageModel.fromJson(json.decode(str));

String getMessageModelToJson(GetMessageModel data) => json.encode(data.toJson());

class GetMessageModel {
    List<Message> messages;

    GetMessageModel({
        required this.messages,
    });

    factory GetMessageModel.fromJson(Map<String, dynamic> json) => GetMessageModel(
        messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    };
}

class Message {
    String id;
    Sender sender;
    String content;
    int v;

    Message({
        required this.id,
        required this.sender,
        required this.content,
        required this.v,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        sender: Sender.fromJson(json["sender"]),
        content: json["content"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender.toJson(),
        "content": content,
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