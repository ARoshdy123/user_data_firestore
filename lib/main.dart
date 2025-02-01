import 'package:flutter/material.dart';
import 'package:user_data_firestore/model/firebase_options.dart';
import 'package:user_data_firestore/screen/user_list_from_firebase.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users Data',
      home: UserListFromFirebase(),
    );
  }
}