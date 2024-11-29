
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatmodel {
  String? senderid;
  String? userid, text, type;
  FieldValue?time;
  bool? read;

  Chatmodel(
      {this.senderid, this.time, this.read, this.userid, this.text, this.type});

  // ----to map--

  Map<String, dynamic> tomap() {
    return {
      "userId": userid ?? "",
      "text": text ?? "",
      "type": type ?? "",
      "read": read ?? false,
      "time": time ?? DateTime.now().toString(),
    };
  }

  // -----------copywith----

  Chatmodel copyWith({
    String? senderid,
    userid,
    String? text,
    bool? read,
    String? type,
    FieldValue? time,
  }) {
    return Chatmodel(
        senderid: senderid ?? this.senderid,
        userid: userid ?? this.userid,
        text: text ?? this.text,
        type: type ?? this.type,
        read: read ?? this.read,
        time: time ?? this.time);
  }


// -----
  Chatmodel.fromjson(Map<String, dynamic> json)
      : senderid = json["senderid"],
        userid = json["userid"],
        text = json["text"] ?? "",
        type = json["type"] ?? "",
        time = json["time"] ?? "",
        read = json["read"] ?? false;
}
