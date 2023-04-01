import 'package:flutter_bookstore_app_master/data/model/book_response_model.dart';

import '../../data/model/book_detail_response_model.dart';

abstract class BookRepository {
  Future<BookResponseModel> getAllNewBook(String query);
  Future<BookDetailModel> getBookDetail(String query);
  Future<BookResponseModel> searchBook(String query);
}
