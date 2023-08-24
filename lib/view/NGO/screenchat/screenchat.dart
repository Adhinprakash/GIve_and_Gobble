import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:give_gobble/controller/api/api_url.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/controller/provider/foodrequests/foodrequest.dart';
import 'package:give_gobble/controller/provider/messageprovider/message_provider.dart';
import 'package:give_gobble/controller/provider/ngo_login.dart';
import 'package:give_gobble/model/get_message_model/get_message_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ScreenNgoChat extends StatefulWidget {
  const ScreenNgoChat({super.key});

  @override
  State<ScreenNgoChat> createState() => _ScreenNgoChatState();
}

class _ScreenNgoChatState extends State<ScreenNgoChat> {
  List<Message> messages = [];
  List<Message> fetchedMessages = [];
  late IO.Socket socket;
  @override
  void initState() {
    socket = IO.io(Api.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    // socket.on('messageRecieved', (data) {
    //   print('Received message: $data');
    //   Provider.of<MessageProvider>(context, listen: false)
    //       .addMessage(Message.fromJson(data));
    // });

    socket.emit('joinChat');

    super.initState();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('list of messages $messages');
    return Consumer<UserFoodrequests>(
      builder: (context, value, _) {
        return Column(
          children: [
            
            SizedBox(
              width: 100.w,
              child: Card(
                color: kwhite,
                shadowColor: const Color.fromARGB(255, 0, 0, 0),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: ListTile(
                  leading: Consumer<NgoLogin>(
                    builder: (context, value, child) {
                      return Container(
                        height: 10.h,
                        width: 10.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.amber),
                        child: Image.network(value.ngodetails.firstWhere(
                            (item) => item['key'] == 'profile',
                            orElse: () => {'value': 'N/A'})['value']),
                      );
                    },
                  ),
                  title:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Text(
                          "chat with community",
                          style: TextStyle(
                              color: Color.fromARGB(255, 138, 76, 171),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      Row(
                        
                        children: [
                          Container(
                            
                            width: 200,
                            height: 20,
                            child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                              itemCount: value.allngos.length,
                              itemBuilder: (context, index) {
                              return Consumer<UserFoodrequests>(
                                builder: (context, value, _) {
                                 return Text(
                                  
                                  "${value.allngos[index]['username']},",style: textStyleFuc(weight: FontWeight.w300, color: kBlack, size: 13),);
                                },
                            );
                            },),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            kHeight15,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  StreamBuilder<List<Message>>(
                  stream: Provider.of<MessageProvider>(context).messageStream,
                  builder: (context, snapshot) {

                    if(snapshot.connectionState==ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator(),);
                    }

                    else if(snapshot.hasError){
                  return const Center(
        child: Text('No messages available.'),
      );
                    }
                    List<Message> messages = snapshot.data!;
                   
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          Message message = messages[index];
                          String ids =
                              Provider.of<NgoLogin>(context, listen: false)
                                  .ngodetails
                                  .firstWhere(
                                    (item) => item['key'] == '_id',
                                    orElse: () => {'value': 'N/A'},
                                  )['value'];
                          bool isCurrentUser = message.sender.id == ids;

                          return Align(
                            alignment: isCurrentUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              width: 42.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                              
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child:Row(
                                crossAxisAlignment: isCurrentUser
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 9.w,
                                      height: 9.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.amber,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              message.sender.profile),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: isCurrentUser
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message.sender.username,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kpurple),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          message.content,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                   
                    // else {
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }
                  },
                ),
              ),
            ),
            Consumer<MessageProvider>(
              builder: (context, value, _) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: value.messageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Type your message...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () async {
                          await value.postMessage();
                          // socket.emit('newMessage',
                          //     {'content': value.messageController.text});

                          value.messageController.clear();
                        },
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
