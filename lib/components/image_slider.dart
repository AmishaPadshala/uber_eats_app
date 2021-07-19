import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uber_eats_app/theme/colors.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;

  ImageSlider({this.images});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              activeImageIndex = index;
            });
          },
          enableInfiniteScroll: false,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          autoPlayAnimationDuration: Duration(seconds: 2),
          // autoPlay: true,
          viewportFraction: 1.0,
        ),
        items: List.generate(widget.images.length, (index) {
          return Stack(
            children: [
              Image.asset(
                "assets/images/slides/${widget.images[index]}",
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 1.5 * kDefaultPadding,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(widget.images.length, (index) {
                        return Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: activeImageIndex == index
                                  ? Colors.white
                                  : Colors.grey),
                        );
                      })))
            ],
          );
        }),
      ),
    );
  }
}
