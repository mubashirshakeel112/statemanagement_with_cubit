import 'package:book_api/presentation/home/cubit/home_cubit.dart';
import 'package:book_api/presentation/home/home_view.dart';
import 'package:book_api/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> HomeCubit(),
      child: MaterialApp(
        initialRoute: HomeView.id,
        onGenerateRoute: RouteGenerator.generateRoutes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}