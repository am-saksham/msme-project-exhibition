import 'package:flutter/material.dart';
import 'package:msme_exhibition/Screens/splash_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: { // Define '/' route here
        '/login': (context) => const LoginScreen(),
        // other routes
      },
      title: 'Micro Mart',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}