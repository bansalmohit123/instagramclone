import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/firebase_options.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_screen_layout.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
       debugShowCheckedModeBanner: false,
   
      home:StreamBuilder( 
       
         stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            if(snapshot.hasData){
              return const ResponsiveLayout(webScreenlayout: WebScreenlayout(), mobileScreenlayout: MobileScreenlayout());
            }
            else if(snapshot.hasError){
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child:  CircularProgressIndicator(
                color:  primaryColor,
              ),
            );
          }
          return const LoginScreen();
         },
         
         

      ) ,
    );
  }
}
