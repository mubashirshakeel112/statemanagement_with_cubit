import 'dart:convert';

import 'package:book_api/constants/endpoints.dart';
import 'package:book_api/domain/book_model.dart';
import 'package:book_api/extension.dart';
import 'package:book_api/infrastructure/api_exception.dart';
import 'package:http/http.dart' as http;

abstract class BooksService{
  Future<BookModel> getBooks();
}

class WCBookService extends BooksService{
  @override
  Future<BookModel> getBooks() async{
    try{
      Uri endpoint  = Uri.parse(Endpoints.baseUrl);
      http.Response response = await http.get(endpoint);
      if(response.isApiSuccessful){
        return bookModelFromJson(response.body);
      }else{
        throw ApiException('Get', response.statusCode, response.body);
      }
    } on ApiException {
      rethrow;
    }
      catch(e){
        rethrow;
    }
  }
  }
