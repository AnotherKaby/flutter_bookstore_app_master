import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bookstore_app_master/data/model/book_model.dart';
import 'package:flutter_bookstore_app_master/data/repository/book_repository_impl.dart';
import 'package:flutter_bookstore_app_master/domain/repository/book_repository.dart';

class HomeController extends GetxController {
  final BookRepository _repository = BookRepositoryImpl();

  Rx<List<BookModel>> listOfBooks = Rx([]);
  Rx<TextEditingController> searchController = Rx(TextEditingController());

  void getBooks() async {
    final response = await _repository.getAllNewBook('');
    listOfBooks(response.books);
    update();
  }

  void searchByText(String input) async {
    if(input!=""){
      final response = await _repository.searchBook(input);
      listOfBooks(response.books);
      update();
    }else{
      getBooks();
    }

  }
}
