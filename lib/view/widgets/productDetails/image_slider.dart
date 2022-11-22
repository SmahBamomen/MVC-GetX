import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_system/logic/controllers/cart_controller.dart';
import 'package:eco_system/routes/routes.dart';
import 'package:eco_system/utils/theme.dart';
import 'package:eco_system/view/widgets/productDetails/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  int currentPage = 0;
  int currentColor = 0;
  final List<Color> colorSelected = [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: 4,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.imageUrl),
                  )),
            );
          },
          options: CarouselOptions(
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              },
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2)),
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: currentPage,
              effect: ExpandingDotsEffect(
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotWidth: 10,
                  dotHeight: 10),
            )),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = index;
                      });
                    },
                    child: ColorPicker(
                        color: colorSelected[index],
                        outerBorder: currentColor == index),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 3,
                    ),
                itemCount: colorSelected.length),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle),
                  padding: EdgeInsets.all(8),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
           Obx(() =>    Badge(
             position: BadgePosition.topEnd(top: -10, end: -10),
             animationDuration: Duration(milliseconds: 300),
             animationType: BadgeAnimationType.slide,
             badgeContent: Text(
               cartController.quantity().toString(),
               style: TextStyle(color: Colors.white),
             ),
             child: InkWell(
               onTap: () {
                 Get.toNamed(Routes.cartScreen);
               },
               child: Container(
                 decoration: BoxDecoration(
                     color: Get.isDarkMode
                         ? pinkClr.withOpacity(0.8)
                         : mainColor.withOpacity(0.8),
                     shape: BoxShape.circle),
                 padding: EdgeInsets.all(8),
                 child: Icon(
                   Icons.shopping_cart,
                   color: Get.isDarkMode ? Colors.black : Colors.white,
                   size: 20,
                 ),
               ),
             ),
           ))

            ],
          ),
        )
      ],
    );
  }
}
