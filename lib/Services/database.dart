import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healme/models/info.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userInfo = Firestore.instance.collection('info');

  Future updateUserData(
      String name, int age, double weight, double height) async {
    return await userInfo.document(uid).setData({
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
    });
  }

  // user info from snapshot
  List<UserInfo> _userInfoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserInfo(
        name: doc.data['name'] ?? '',
        age: doc.data['age'] ?? 0,
        weight: doc.data['weight'] ?? 0.0,
        height: doc.data['height'] ?? 0.0,
      );
    }).toList();
  }

  //get user info stream
  Stream<List<UserInfo>> get info {
    return userInfo.snapshots().map(_userInfoListFromSnapshot);
  }
}
