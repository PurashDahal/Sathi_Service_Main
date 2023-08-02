import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:singleclinic/main.dart';

class SliderImage extends StatelessWidget {
  SliderImage({Key key}) : super(key: key);
  final List<String> imageList = [
    'assets/departmentScreen/slider.jpg',
    'assets/departmentScreen/slider.jpg',
    'assets/departmentScreen/slider.jpg',
    'assets/departmentScreen/slider.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        // width: double.infinity,
        // color: background2,
        child: CarouselSlider(
          options: CarouselOptions(
            // padEnds: true,

            height: 170,

            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            initialPage: 0,
            aspectRatio: 16 / 9,
            viewportFraction: 0.96,
          ),
          items: imageList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width * 1,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fill,
                    // width: MediaQuery.of(context).size.width * 0.9,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
