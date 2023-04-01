import 'package:dio/dio.dart';
import 'package:flutter_bookstore_app_master/constants/constants.dart';
import 'package:flutter_bookstore_app_master/data/model/book_response_model.dart';

class BookDatasourceDio {
  final Dio _client = Dio();

  Future<BookResponseModel> getBooks() async {
    try {
      final urlPath = Constants.allNewBook;

      final response = await _client.get(urlPath);

      if (response.statusCode == 200) {
        return BookResponseModel.fromJson(response.data);
      }

      return BookResponseModel();
    } catch (e) {
      rethrow;
    }
  }
}
