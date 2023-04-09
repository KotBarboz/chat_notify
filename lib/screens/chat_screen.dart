import 'package:chat_with_notifications/widgets/chat/messages.dart';
import 'package:chat_with_notifications/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('myChat'),
        actions: [
          DropdownButton(
            underline: const SizedBox(),
            dropdownColor: Colors.transparent,
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors
                          .orangeAccent, //background color of dropdown button
                      border: Border.all(
                          color: Colors.black38,
                          width: 3), //border of dropdown button
                      borderRadius: BorderRadius.circular(
                          50), //border raiuds of dropdown button
                      boxShadow: const <BoxShadow>[
                        //apply shadow on Dropdown button
                        BoxShadow(
                            color: Color.fromRGBO(
                                0, 0, 0, 0.57), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    // decoration: BoxDecoration(
                    //   color: Colors.greenAccent, //<-- SEE HERE
                    // ),
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app, color: Colors.deepPurple),
                        SizedBox(width: 8),
                        Text('Logout',
                            style: TextStyle(color: Colors.deepPurple)),
                      ],
                    ),
                  ),
                ),
              )
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            icon: Icon(Icons.more_vert),
            style: TextStyle(
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: const [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     //
      //     FirebaseFirestore.instance
      //         .collection('chats/Vt4qRPCaeVgvxiJKMChd/messages')
      //         .add(
      //             {'text': 'Test message ${DateTime.now().toIso8601String()}'});
      //   },
      // ),
    );
  }
}
