
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:give_gobble/model/get_message_model/get_message_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart'as IO;

 class MessageProvider extends ChangeNotifier {
  final messageController = TextEditingController();
  List<Message> messages = [];  
  late IO.Socket socket;

  final _messageStreamController = StreamController<List<Message>>.broadcast();
  Stream<List<Message>> get messageStream => _messageStreamController.stream;

  MessageProvider() {
    socket = IO.io(Api.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('messageRecieved', (data) {
      print('Received message: $data');
      addMessage(Message.fromJson(data));
    });

    socket.emit('joinChat');
  }

  Future<void> getMessages() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ngoAccess = sharedPreferences.getString('ngoAccess')!;
    try {
      final response = await http.get(
        Uri.parse(Api.getmessage),
        headers: {
          'Authorization': 'Bearer $ngoAccess',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        GetMessageModel getMessageModel = GetMessageModel.fromJson(data);
        List<Message> messageList = getMessageModel.messages;
        messages.addAll(messageList);
        _messageStreamController.add(messages); // Update stream with messages
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> postMessage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ngoAccess = sharedPreferences.getString('ngoAccess')!;
    final String message = messageController.text;

    try {
      final response = await http.post(
        Uri.parse(Api.postmessage),
        headers: {
          'Authorization': 'Bearer $ngoAccess',
        },
        body: {
          "message": message,
        },  
      );

      if (response.statusCode == 201) {
        print(jsonDecode(response.body)['newMessage']);
        socket.emit('newMessage',jsonDecode(response.body)['newMessage']);
        socket.on('messageRecieved', (_) {
        print('Received message: "hellooooooo"');
      // Provider.of<MessageProvider>(context, listen: false)
      //     .addMessage(Message.fromJson(data));
       });
        messageController.clear();
      }
    } catch (e) {
      // Handle error
    }
  }

  void addMessage(Message message) {
    messages.add(message);
    _messageStreamController.add(messages); // Update stream with messages
  }

  void dispose() {
    _messageStreamController.close();
    socket.disconnect();
    super.dispose();
  }
}