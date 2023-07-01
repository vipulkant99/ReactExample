import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_example/bloc/login/login_bloc.dart';
import 'package:react_example/repo/main_repo.dart';
import 'package:react_example/screens/home_screen.dart';
import 'package:react_example/screens/login_screen.dart';
import 'package:react_example/screens/splash_screen.dart';
import 'package:react_example/services/main_service.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>  MainRepo(mainServices: MainService(httpClient: http.Client())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc(mainRepository: context.read<MainRepo>()),)
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          routes: {
            LoginScreen.routeName:(context) => const LoginScreen(),
            HomeScreen.routeName:(context) => const HomeScreen()
          },
        ),
      ),
    );
  }
}
