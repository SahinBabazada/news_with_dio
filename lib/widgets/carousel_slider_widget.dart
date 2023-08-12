import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/carousel_item.dart';
import 'package:timeago/timeago.dart' as timeago;

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() {
    return _CarouselSliderWidgetState();
  }
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    var newsApi =
        DefaultAssetBundle.of(context).loadString('assets/api/news.json');

    return FutureBuilder(
      future: newsApi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('Data not found');
        }

        var news = jsonDecode(snapshot.data.toString());
        List newsList = news['Breaking news'];

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                disableCenter: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                height: 200,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: sliderItems(newsList),
            ),
            AnimatedSmoothIndicator(
              activeIndex: _current,
              count: newsList.length,
              effect: const ExpandingDotsEffect(
                expansionFactor: 3,
                offset: 16.0,
                dotWidth: 8.0,
                dotHeight: 8.0,
                spacing: 4.0,
                radius: 8.0,
                strokeWidth: 1.0,
                dotColor: Color.fromRGBO(240, 241, 243, 1),
                activeDotColor: Color.fromRGBO(17, 138, 231, 1),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Container> sliderItems(List carouselItems) {
    List<CarouselItem>  breakingNews = List.generate(carouselItems.length, (index) => CarouselItem.fromJson(carouselItems[index]));
    return breakingNews
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.3,
                  blurRadius: 20,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
              child: Stack(
                children: [
                  Image.network(
                    item.imageSource,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  Container(
                    height: 350.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          const Color.fromARGB(255, 85, 85, 85)
                              .withOpacity(0.2),
                          Colors.black,
                        ],
                        stops: const [
                          0.0,
                          1.0,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                      decoration: BoxDecoration(
                        color: item.category.colorCode,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        item.category.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              item.userName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Text(
                              " • ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              timeago.format(item.createdDate),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
