import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/pages/signinpage.dart';
import 'package:todo_app/pages/signuppage.dart';
import 'package:todo_app/service/Auth_Services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass= AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: ()async{
          await authClass.logout();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>MyApp()), (route)=> false);
        }, icon: Icon(Icons.logout))],
      ),
    );
  }
}
