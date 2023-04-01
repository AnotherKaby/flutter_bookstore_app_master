import 'dart:convert';

import 'package:flutter_bookstore_app_master/constants/constants.dart';
import 'package:flutter_bookstore_app_master/data/model/book_response_model.dart';
import 'package:http/http.dart' as client;

import '../model/book_detail_response_model.dart';

class BookDatasourceHttp {
  Future<BookResponseModel> getBooks(String query) async {
    try {
      final urlPath = Constants.allNewBook + query;

      final response = await client.get(Uri.parse(urlPath));

      if (response.statusCode == 200) {
        return BookResponseModel.fromJson(json.decode(response.body));
      }

      return BookResponseModel();
    } catch (e) {
      rethrow;
    }
  }

  Future<BookDetailModel> getDetail(String query) async {
    try {
      final urlPath = Constants.bookDetail + query;

      final response = await client.get(Uri.parse(urlPath));

      if (response.statusCode == 200) {
        return BookDetailModel.fromJson(json.decode(response.body));
      }

      return BookDetailModel();
    } catch (e) {
      rethrow;
    }

  }

  Future<BookResponseModel> searchBooks(String query) async {
    try {
      final urlPath = Constants.searchBook + query;

      final response = await client.get(Uri.parse(urlPath));

      if (response.statusCode == 200) {
        return BookResponseModel.fromJson(json.decode(response.body));
      }

      return BookResponseModel();
    } catch (e) {
      rethrow;
    }

  }


}
