import 'package:eco_system/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_) => TextField(
              controller: controller.searchTextController,
              onChanged: (searchName) {
                controller.addSearchToList(searchName);
              },
          style: TextStyle(
            color: Colors.black
          ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  suffixIcon: controller.searchTextController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            controller.clearSearch();
                          },
                          icon: Icon(color: Colors.black, Icons.close),
                        )
                      : null,
                  fillColor: Colors.white,
                  focusColor: Colors.red,
                  hintText: "Search with name & price",
                  hintStyle: TextStyle(
                    color: Get.isDarkMode ? Colors.black45 : Colors.black45
                  ),

                  helperStyle: TextStyle(
                      color:  Colors.black45,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ));
  }
}
