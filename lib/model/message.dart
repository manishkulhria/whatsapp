import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { Text, Image }

class Message {
  String? senderID;
  String? content;
  MessageType? messageType;
  Timestamp? sentAt;

  Message({
    required this.senderID,
    required this.content,
    required this.sentAt,
    required this.messageType,
  });

  // Updated fromJson with null and invalid type handling
  Message.fromJson(Map<String, dynamic> json)
      : senderID = json['senderID'],
        content = json['content'],
        sentAt = json['sentAt'],
        messageType = _getMessageType(json['messageType']);

  // Handle potential null or invalid messageType values
  static MessageType _getMessageType(String? type) {
    if (type != null && MessageType.values.any((e) => e.name == type)) {
      return MessageType.values.byName(type);
    } else {
      return MessageType.Text; 
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'content': content,
      'sentAt': sentAt,
      "messageType": messageType?.name ?? 'Text', // Default to 'Text' if null
    };
  }
}
