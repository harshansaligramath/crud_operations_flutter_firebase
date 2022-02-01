import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              // title: 'Flutter Fire Store CRUD',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
