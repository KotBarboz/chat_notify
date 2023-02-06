import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = streamSnapshot.data?.docs;
          return ListView.builder(
            itemCount: streamSnapshot.data?.docs.length ?? 0,
            itemBuilder: (ctx, index) => Container(
              padding: const EdgeInsets.all(8),
              child: Text(docs![index]['text']),
            ),
          );
        },
        stream: FirebaseFirestore.instance
            .collection('chats/Vt4qRPCaeVgvxiJKMChd/messages')
            .snapshots(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //
          FirebaseFirestore.instance
              .collection('chats/Vt4qRPCaeVgvxiJKMChd/messages')
              .add(
                  {'text': 'Test message ${DateTime.now().toIso8601String()}'});
        },
      ),
    );
  }
}
