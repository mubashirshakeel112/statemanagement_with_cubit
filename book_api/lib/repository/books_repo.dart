import 'package:book_api/domain/book_model.dart';
import 'package:book_api/services/books_service.dart';

class BooksRepository extends BooksService{
  final WCBookService _wcBookService = WCBookService();
  @override
  Future<BookModel> getBooks() async{
    return await _wcBookService.getBooks();
  }
}