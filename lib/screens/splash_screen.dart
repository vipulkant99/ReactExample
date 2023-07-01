import 'package:flutter/material.dart';
import 'package:react_example/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Image.asset('images/logo.png'),
                 SizedBox(height: queryData.size.height * 0.1),
                 const Text(
                   "ESPARSE  BUSINESS SOLUTIONS",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                     fontSize: 20
                   ),
                 )
                ],
              )
              ),
          ),
        )
        ),
    );
  }
}