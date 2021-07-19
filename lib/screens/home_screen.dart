import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:uber_eats_app/components/image_slider.dart';
import 'package:uber_eats_app/constants.dart';
import 'package:uber_eats_app/theme/colors.dart';
import 'package:uber_eats_app/theme/styles.dart';
import 'package:uber_eats_app/extensions.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: kDefaultPadding,
          ),
          _MenuBar(),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          buildLocationFilterBar(size),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          ImageSlider(images: slides),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Container(
            height: kDefaultPadding / 2,
            color: kPrimaryColorLight,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          buildCategories(),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Container(
            height: kDefaultPadding / 2,
            color: kPrimaryColorLight,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          buildMoreToExplore(size),
        ],
      )),
    );
  }

  Widget buildMoreToExplore(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: kDefaultPadding / 2),
          child: Text(
            "More to explore",
            style: customText,
          ),
        ),
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(exploreMenu.length, (index) {
              Map<String, dynamic> item = exploreMenu[index];
              return Padding(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width - kDefaultPadding,
                          height: 160,
                          child: Image.network(
                            item["img"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            bottom: 15,
                            right: 15,
                            child: SvgPicture.asset(
                              item["is_liked"]
                                  ? "assets/images/icons/loved_icon.svg"
                                  : "assets/images/icons/love_icon.svg",
                              width: 20,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(item["name"], style: customText),
                    SizedBox(height: kDefaultPadding / 4),
                    Text(item["description"], style: customContent),
                    SizedBox(height: kDefaultPadding / 4),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kDefaultPadding / 4),
                          color: kAccentColor.withOpacity(0.3),
                          child: Icon(
                            Icons.hourglass_bottom,
                            size: 16,
                            color: kAccentColor,
                          ),
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Container(
                          padding: EdgeInsets.all(kDefaultPadding / 4),
                          color: kPrimaryColorLight.withOpacity(0.3),
                          child: Text(item["time"], style: customContent),
                        ),
                        SizedBox(width: kDefaultPadding / 4),
                        Container(
                          padding: EdgeInsets.all(kDefaultPadding / 4),
                          color: kPrimaryColorLight.withOpacity(0.3),
                          child: Row(children: [
                            Text(item["rate"], style: customContent),
                            SizedBox(width: kDefaultPadding / 4),
                            Icon(
                              Icons.star,
                              color: kYellowStar,
                              size: 17,
                            ),
                            SizedBox(width: kDefaultPadding / 4),
                            Text(item["rate_number"], style: customContent),
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget buildCategories() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return Container(
            padding: EdgeInsets.only(
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding / 2,
                left: kDefaultPadding,
                right: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset(
                      "assets/images/categories/${categories[index]}.svg"),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Text(
                  "${categories[index].capitalize()}",
                  style: customText,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Row buildLocationFilterBar(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: kDefaultPadding / 2),
          padding: EdgeInsets.all(kDefaultPadding / 2),
          width: size.width - 70,
          height: 50,
          decoration: BoxDecoration(
              color: kPrimaryColorLight,
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Container(
                  width: 20,
                  child: SvgPicture.asset("assets/images/icons/pin_icon.svg")),
              SizedBox(
                width: 5,
              ),
              Text(
                "New York",
                style: customText,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(kDefaultPadding / 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                        width: 30,
                        child: SvgPicture.asset(
                            "assets/images/icons/time_icon.svg")),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Now",
                      style: customText,
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(child: SvgPicture.asset("assets/images/icons/filter_icon.svg"))
      ],
    );
  }
}

class _MenuBar extends StatefulWidget {
  @override
  __MenuBarState createState() => __MenuBarState();
}

class __MenuBarState extends State<_MenuBar> {
  int activeMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(menus.length, (index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  activeMenuIndex = index;
                });
              },
              child: activeMenuIndex == index
                  ? ElasticIn(child: buildMenuItem(index))
                  : buildMenuItem(index));
        }));
  }

  Widget buildMenuItem(int index) {
    return Container(
      margin: index == menus.length - 1
          ? EdgeInsets.only(right: 0)
          : EdgeInsets.only(right: kDefaultPadding),
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          color: activeMenuIndex == index ? kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          menus[index],
          style: activeMenuIndex == index
              ? customText.copyWith(color: Colors.white)
              : customText.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
