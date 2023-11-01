import 'package:finalimagep/adminpanel/adminpanel.dart';
import 'package:finalimagep/maindesing/baindesing.dart';
import 'package:finalimagep/poductpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}
  class MyApp  extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    return MaterialApp(
    
      home:Homepage(),
    );
  }
}