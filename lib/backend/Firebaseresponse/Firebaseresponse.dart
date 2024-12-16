import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseResponseModel {
  final Map<String, dynamic> data;
  final String docId;

  FirebaseResponseModel({required this.data, required this.docId});

  factory FirebaseResponseModel.fromResponse(DocumentSnapshot snapshot) {
    return FirebaseResponseModel(
      data: snapshot.data()
          as Map<String, dynamic>, // Convert Firestore snapshot data to Map
      docId: snapshot.id,
    );
  }
}
