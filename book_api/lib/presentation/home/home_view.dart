import 'package:book_api/presentation/home/cubit/home_cubit.dart';
import 'package:book_api/presentation/home/cubit/home_state.dart';
import 'package:book_api/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  static const String id = '/home_view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeCubit>().getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 20),
              CustomTextField(
                margin: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search...',
                isSuffixIconShow: true,
                suffixIcon: Icons.search,
                onChanged: (value) => context.read<HomeCubit>().searchFilter(value),
              ),

              /// Loading Stage
              if (state is HomeLoadingState)
                const Expanded(
                  child: Center(child: CircularProgressIndicator(color: Colors.deepOrange)),
                ),

              /// Data not found
              if (state is HomeSuccessState && state.books.items!.isEmpty)
                Expanded(child: Center(child: Text("No books found"))),

              /// If Data Loaded Successfully
              if (state is HomeSuccessState)
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: state.books.items?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.network(state.books.items?[index].volumeInfo?.imageLinks?.thumbnail ?? ''),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                state.books.items?[index].volumeInfo?.title ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                state.books.items?[index].volumeInfo?.subtitle ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(state.books.items?[index].volumeInfo?.authors?.first ?? ''),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
