// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bookstore_app_master/presentation/screen/detail/page/detail_page.dart';
import 'package:flutter_bookstore_app_master/presentation/screen/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<HomeController>(
            init: _controller,
            initState: (state) => _controller.getBooks(),
            builder: (context) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text("Discover",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
                    TextField(
                      controller: _controller.searchController.value,
                      onChanged: (value) => _controller.searchByText(value),
                      onSubmitted: (value) => _controller.searchByText(value),
                      decoration: const InputDecoration(
                          hintText: 'Search Book',
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                          prefixIcon: IconButton(onPressed: null, icon: Icon(Icons.search)),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        //shrinkWrap: true,
                        itemCount: _controller.listOfBooks.value.length,
                        itemBuilder: (context, index) {
                          final book = _controller.listOfBooks.value[index];

                          return InkWell(
                            onTap: () =>
                                Get.to(DetailPage(isbn13: book.isbn13 ?? '')),
                            child: Container(
                              height: 140,
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
                              child: Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          book.image ?? '',
                                          height: 140,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      //mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(book.title ?? 'Empty',
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 4),
                                        Text(book.subtitle ?? 'Empty',
                                          style: TextStyle(fontSize: 12,color:Colors.grey,fontWeight: FontWeight.normal),),
                                        SizedBox(height: 12),
                                        Text(book.price ?? 'Empty',
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
