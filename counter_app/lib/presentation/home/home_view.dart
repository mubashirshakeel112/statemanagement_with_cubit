import 'package:counter_app/presentation/home/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  static const String id = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Counter App',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, counter) {
          return Stack(
            children: [
              Center(
                child: Text(
                  counter.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CounterCubit>().decrement();
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
