import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';

enum MessageType { Text, Image }

class Message {
  String? toid;
  String? fromid;
  String? msg;
  String? sentAt;
  MessageType? messageType;
  String? read;

  Message(
      {this.toid,
      this.fromid,
      this.msg,
      this.sentAt,
      this.messageType,
      this.read});

  Message.fromjson(FirebaseResponseModel json)
      : toid = json.docId,
        fromid = json.data["fromid"],
        msg = json.data['msg'],
        sentAt = json.data['sentAt'],
        messageType = MessageType.values[json.data['messageType']],
        read = json.data['read'];

  Map<String, dynamic> toMap() => {
        'toid': toid,
        'fromid': fromid,
        'msg': msg,
        'sentAt': sentAt,
        'messageType': messageType!.index,
        'read': read
      };
}
