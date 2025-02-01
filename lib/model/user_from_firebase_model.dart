
import 'package:cloud_firestore/cloud_firestore.dart';
// user model contain name and age and favourite hobby
class UserFromFirebaseModel {

  final String? name;
  final String? favHobby;
  final int? age;

  UserFromFirebaseModel(
     {

    this.name,
    this.favHobby,
    this.age,
  });

  factory UserFromFirebaseModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserFromFirebaseModel(
      name: data?['name'],
      favHobby: data?['favHobby'],
      age: data?['age'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (favHobby != null) "favHobby": favHobby,
      if (age != null) "age": age,
    };
  }
}
