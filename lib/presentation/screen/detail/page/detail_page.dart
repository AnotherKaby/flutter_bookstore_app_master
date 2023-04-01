import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_bookstore_app_master/presentation/screen/detail/controller/detail_controller.dart';

class DetailPage extends StatelessWidget {
  final String isbn13;
  DetailPage({super.key, required this.isbn13});
  final _controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Detail"),),
      body: GetBuilder<DetailController>(
          init: _controller,
          initState: (state) => _controller.getDetail(isbn13),
          builder: (context) {
            final book = _controller.book.value;
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Image.network(
                      book.image ?? '',
                      errorBuilder: (context, error, stackTrace) {
                        return Text("Loading Image");
                      },
                      //fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(book.title ?? 'Empty',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          RatingBar.builder(
                            initialRating: double.parse(book.rating!),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 14.0,
                            itemPadding: EdgeInsets.symmetric(vertical: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(book.price ?? 'Empty',
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Flexible(
                                  child: Text("Author : ",
                                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),),
                              Flexible(
                                child: Text("${book.authors ?? 'Empty'}",
                                  style: TextStyle(fontSize: 12,color:Colors.blueAccent,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text("Publisher : ",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),),
                              Flexible(
                                child: Text("${book.publisher ?? 'Empty'}",
                                  style: TextStyle(fontSize: 12,color:Colors.blueAccent,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text("Language : ",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),),
                              Flexible(
                                child: Text("${book.language ?? 'Empty'}",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text("Year : ",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),),
                              Flexible(
                                child: Text("${book.year ?? 'Empty'}",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text("Pages : ",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),),
                              Flexible(
                                child: Text("${book.pages ?? 'Empty'}",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Description",
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          SizedBox(
                            height: 4,
                          ),
                          Text(book.desc ?? 'Empty',
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),textAlign: TextAlign.justify,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
