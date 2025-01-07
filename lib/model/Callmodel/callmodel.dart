enum calltype { AUDIO, VIDEO }

class Callmodel {
  String? id;
  String? callername;
  String? callerimg;
  String? calleruid;
  String? callerphn;
  String? receivername;
  String? receiverimg;
  String? receiveruid;
  String? receiverphn;
  String? status;
  String? type;
  String? time;
  Callmodel(
      {this.id,
      this.callername,
      this.callerimg,
      this.calleruid,
      this.callerphn,
      this.receivername,
      this.receiverimg,
      this.receiveruid,
      this.receiverphn,
      this.status,
      this.type,
      this.time});

  Callmodel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        callername = json['callername'] ?? '',
        callerimg = json['callerimg'] ?? '',
        calleruid = json['calleruid'] ?? '',
        callerphn = json['callerphn'] ?? '',
        receivername = json['receivername'] ?? '',
        receiverimg = json['receiverimg'] ?? '',
        receiveruid = json['receiveruid'] ?? '',
        receiverphn = json['receiverphn'] ?? '',
        status = json['status'] ?? '',
        type = json['type'] ?? '',
        time = json['time'] ?? '';

  Map<String, dynamic> toMap() => {
        'id': id,
        'callername': callername,
        'callerimg': callerimg,
        'calleruid': calleruid,
        'callerphn': callerphn,
        'receivername,': receivername,
        'receiverimg,': receiverimg,
        'receiveruid,': receiveruid,
        'receiverphn,': receiverphn,
        'status': status,
        'type': type,
        'time': time
      };
}
