import 'package:chatApp/widgets/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return StreamBuilder(
          stream: Firestore.instance
              .collection('chat')
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (ctx, chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            var chatData = chatSnapshot.data.documents;

            return ListView.builder(
              reverse: true,
              itemCount: chatData.length,
              itemBuilder: (ctx, index) => MessageBubble(
                chatData[index]['text'],
                chatData[index]['userId'] == futureSnapshot.data.uid,
                chatData[index]['username'],
                key: ValueKey(chatData[index].documentID),
              ),
            );
          },
        );
      },
    );
  }
}
