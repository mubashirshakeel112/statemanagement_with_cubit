import 'package:book_api/domain/book_model.dart';
import 'package:book_api/presentation/home/cubit/home_state.dart';
import 'package:book_api/repository/books_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final BooksRepository booksRepository = BooksRepository();

  HomeCubit() : super(HomeInitialState());

  List<Item>? originalBooks;

  Future<void> getBooks() async {
    emit(HomeLoadingState());
    try {
      final result = await booksRepository.getBooks();
      originalBooks = result.items;
      emit(HomeSuccessState(result));
    } catch (e) {
      emit(HomeFailureState(e.toString()));
    }
  }

  void searchFilter(String query) {
    if (originalBooks == null) return;

    final trimmedQuery = query.trim().toLowerCase();
    if (trimmedQuery.isEmpty) {
      emit(HomeSuccessState(BookModel(items: originalBooks)));
    } else {
      final filteredBooks = originalBooks!
          .where((book) => book.volumeInfo?.title
          ?.toLowerCase()
          .contains(trimmedQuery) ??
          false)
          .toList();

      emit(HomeSuccessState(BookModel(items: filteredBooks)));
    }
  }
}
