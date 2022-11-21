import 'package:eco_system/logic/controllers/product_controller.dart';
import 'package:eco_system/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FavoriateScreen extends StatelessWidget {
   FavoriateScreen({Key? key}) : super(key: key);
final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx((){
        if (controller.favouritesList.isEmpty){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/images/heart.png"),
                ),
                SizedBox(height: 20),
                Text("Please , Add your favorites products.",style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
          );
        }
        else {
          return ListView.separated(
              itemBuilder: (context , index){
                return buildFavItems(
                  price: controller.favouritesList[index].price,
                  title: controller.favouritesList[index].title,
                  image:controller.favouritesList[index].image,
                  productID: controller.favouritesList[index].id
                );
              },
              separatorBuilder: (context , index){
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favouritesList.length);
        }
      }),
      

    );
  }
  Widget buildFavItems({
    required String image ,
    required String title,
  required double price,
    required int productID,
}){
    return Padding(
        padding: EdgeInsets.all(10),
    child: Container(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
               SizedBox(
                 child: Card(
                   clipBehavior: Clip.antiAlias,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10)
                   ),
                   child: AspectRatio(
                     aspectRatio: 1,
                     child: Image.network(image,fit: BoxFit.cover,),
                   ),
                 ),
               ),
          SizedBox(width: 15),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(title,style: TextStyle(
                 color: Get.isDarkMode ? Colors.white : Colors.black,
fontSize: 16,
                 overflow: TextOverflow.ellipsis,
                 fontWeight: FontWeight.bold
               ),

               ),
                SizedBox(height: 10),
                Text("\$ $price",style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold
                ),

                )
              ],
            ),
          ),
          IconButton(onPressed: (){
            controller.manageFavourites(productID);
          },
              icon: Icon(Icons.favorite,
                color: Colors.red,size: 30,))
        ],
      ),
    ),);
  }
}
