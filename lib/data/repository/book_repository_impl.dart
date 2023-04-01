import 'package:flutter_bookstore_app_master/data/datasource/book_datasource_dio.dart';
import 'package:flutter_bookstore_app_master/data/datasource/book_datasource_http.dart';
import 'package:flutter_bookstore_app_master/data/model/book_response_model.dart';
import 'package:flutter_bookstore_app_master/domain/repository/book_repository.dart';

import '../model/book_detail_response_model.dart';

class BookRepositoryImpl implements BookRepository {
  //final BookDatasourceDio _datasourceDio = BookDatasourceDio();
  final BookDatasourceHttp _datasourceHttp = BookDatasourceHttp();

  @override
  Future<BookResponseModel> getAllNewBook(String query) async {
    return await _datasourceHttp.getBooks(query);
  }
  @override
  Future<BookDetailModel> getBookDetail(String query) async {
    return await _datasourceHttp.getDetail(query);
  }
  @override
  Future<BookResponseModel> searchBook(String query) async {
    return await _datasourceHttp.searchBooks(query);
  }
}
