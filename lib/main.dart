import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/pages/signinpage.dart';
import 'package:todo_app/pages/signuppage.dart';
import 'package:todo_app/service/Auth_Services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
 class MyApp extends StatefulWidget {
   const MyApp({super.key});

   @override
   State<MyApp> createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {

  Widget currentPage = Signuppage();
  AuthClass authClass= AuthClass();


   @override
   void initState(){
     super.initState();
   }
   void checkLogin() async{
     String? token = await authClass.getToken();
     if(token != null){
       setState(() {
         currentPage = HomePage();
       });
     }
   }

   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: currentPage,

     );
   }
 }

