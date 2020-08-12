import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final bool isMe;
  final Key key;

  MessageBubble(this.message, this.isMe, this.username, {this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      key: key,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(10),
                  bottomRight:
                      isMe ? Radius.circular(0) : Radius.circular(10))),
          width: 150.0,
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                username,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                message,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
