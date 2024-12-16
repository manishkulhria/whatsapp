import 'package:whatsapp/backend/Firebaseresponse/Firebaseresponse.dart';

class Usermodel {
  String? image;
  String? about;
  String? name;
  String? id;
  String? lastActive;
  String? phoneno;
  Usermodel({
    this.image,
    this.about,
    this.name,
    this.id,
    this.lastActive,
    this.phoneno,
  });

  Usermodel.fromJson(FirebaseResponseModel json) {
    image = json.data['image'] ?? '';
    about = json.data['about'] ?? '';
    name = json.data['name'] ?? '';

    id = json.docId;
    lastActive = json.data['last_active'] ?? '';
    phoneno = json.data['phoneno'] ?? '';
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['phoneno'] = phoneno;
    return data;
  }
}
