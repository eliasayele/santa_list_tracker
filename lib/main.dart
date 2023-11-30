import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santas_list_tracker/presentation/bloc/santas_list_bloc.dart';
import 'package:santas_list_tracker/presentation/screens/santa_list_screen.dart';

///  The entry point of the application.
///  since it's small test app, I have ignore all the abstractions inorder to make it simple
///  Bloc is used for state management
///  I have also included a bloc test
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santa\'s List Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD84D56)),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SantasListBloc()..add(SantasListInitialEvent()),
        child: const SantasListScreen(),
      ),
    );
  }
}
