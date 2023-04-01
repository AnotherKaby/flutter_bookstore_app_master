import 'package:get/get.dart';
import 'package:flutter_bookstore_app_master/data/model/book_model.dart';

import '../../../../data/model/book_detail_response_model.dart';
import '../../../../data/repository/book_repository_impl.dart';
import '../../../../domain/repository/book_repository.dart';

class DetailController extends GetxController {
  final BookRepository _repository = BookRepositoryImpl();

  Rx<BookDetailModel> book = Rx(BookDetailModel());
  void getDetail(String isbn13) async {
    final response = await _repository.getBookDetail(isbn13);
    book(response);
    update();
  }
}