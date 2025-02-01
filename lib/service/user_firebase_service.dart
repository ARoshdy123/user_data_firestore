import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_data_firestore/model/user_from_firebase_model.dart';

class UsersFireBaseService {
  var db = FirebaseFirestore.instance;

  // get users realtime
  Stream<List<UserFromFirebaseModel>> getUserFromFirebase() {
    return db.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => UserFromFirebaseModel.fromFirestore(doc,null)).toList();
    });
  }
}
