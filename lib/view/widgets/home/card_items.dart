import 'package:eco_system/logic/controllers/cart_controller.dart';
import 'package:eco_system/logic/controllers/product_controller.dart';
import 'package:eco_system/model/product_model.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/screens/auth/product_details_screen.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.searchList.isEmpty && controller.searchTextController.text.isNotEmpty?
          Get.isDarkMode ? Image.asset("assets/images/search_empty_dark.png"):Image.asset("assets/images/search_empry_light.png"):Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:controller.searchList.isEmpty ? controller.productList.length: controller.searchList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200),
              itemBuilder: (context, index) {
                if (controller.searchList.isNotEmpty){
                  return buildCardItems(
                      image: controller.searchList[index].image,
                      price: controller.searchList[index].price,
                      rate: controller.searchList[index].rating.rate,
                      productID: controller.searchList[index].id,
                      productModels: controller.searchList[index],
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                          productModels: controller.searchList[index],
                        ));
                      });
                }
                else {
                  return buildCardItems(
                      image: controller.productList[index].image,
                      price: controller.productList[index].price,
                      rate: controller.productList[index].rating.rate,
                      productID: controller.productList[index].id,
                      productModels: controller.productList[index],
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                          productModels: controller.searchList[index],
                        ));
                      });
                }

              },
            ),
          ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productID,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.manageFavourites(productID);
                        },
                        icon: controller.isFavourites(productID)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              )),
                    IconButton(
                        onPressed: () {
                          cartController.addProductToCrt(productModels);
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(fit: BoxFit.fitHeight, image),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                                text: rate.toString(),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                underLine: TextDecoration.none),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
