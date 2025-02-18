import 'package:chat/Login.dart';
import 'package:chat/chat_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message model.dart';

class Home extends StatelessWidget {
  Home({super.key});
  static String id = 'HomePage';
  final _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller = TextEditingController();

  String KCREATED = "createdAt";

  @override
  Widget build(BuildContext context) {
    var email =ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(descending: false, KCREATED).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: PrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/scholar.png",
                        height: 50,
                      ),
                      Text(
                        ' Chatting',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          controller: _controller,
                          itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].Id == email ?  ChatBuble(
                        message: messagesList[index],
                      ) : ChatBubleForFriend(message: messagesList[index]);
                    }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (value) {
                          messages.add(
                              {'Message': value, KCREATED: DateTime.now(),'Id': email});
                          controller.clear();
                          _controller.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.send),
                            hintText: "Send message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: PrimaryColor,
                                ))),
                      ),
                    )
                  ],
                ));
          } else {
            return Text('Loading...');
          }
        });
  }
}
