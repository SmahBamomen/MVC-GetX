import 'package:eco_system/model/product_model.dart';
import 'package:eco_system/view/widgets/productDetails/add_cart.dart';
import 'package:eco_system/view/widgets/productDetails/clothes_info.dart';
import 'package:eco_system/view/widgets/productDetails/image_slider.dart';
import 'package:eco_system/view/widgets/productDetails/size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({Key? key, required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSliders(imageUrl: productModels.image,),
            ClothesInfo(
              title: productModels.title,productId: productModels.id,rate: productModels.rating.rate,description: productModels.description,),
            SizeList(),
            AddCart(
              productModels:productModels ,
              price: productModels.price,
            )
          ],
        ),
      ),
    );
  }
}
