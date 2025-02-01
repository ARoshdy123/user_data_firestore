import 'package:flutter/material.dart';
import 'package:user_data_firestore/screen/user_add_firebase.dart';
import 'package:user_data_firestore/service/user_firebase_service.dart';
import 'package:user_data_firestore/model/user_from_firebase_model.dart';

class UserListFromFirebase extends StatefulWidget {
  const UserListFromFirebase({super.key});

  @override
  State<UserListFromFirebase> createState() => _UserListFromFirebaseState();
}

class _UserListFromFirebaseState extends State<UserListFromFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users Data')),
      // to get realtime updates
      body: StreamBuilder<List<UserFromFirebaseModel>>(
        stream: UsersFireBaseService().getUserFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));

          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  trailing: Icon(Icons.person),
                  leading: Text("${user.name}"),
                  title: Text('My hobbies: ${user.favHobby}'),
                  subtitle: Text('My Age: ${user.age}'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddUsersScreen()),
          );
        },
        label: Text('Add user'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
