// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar_widget.dart';
import '../widgets/carousel_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton.filled(
          onPressed: () {},
          icon: Icon(Icons.menu),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(0xFFFf6f6f7),
            ),
          ),
        ),
        actions: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.search),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xFFFf6f6f7),
              ),
            ),
          ),
          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color(0xFFFf6f6f7),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Breaking news",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFF50a8ed)),
                        ),
                      ),
                    ],
                  ),
                  CarouselSliderWidget(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommendation",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFF50a8ed)),
                        ),
                      ),
                    ],
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: 4,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Row(
                  //         children: [
                  //           ClipRRect(
                  //             borderRadius: const BorderRadius.all(
                  //               Radius.circular(20.0),
                  //             ),
                  //             child: Container(
                  //               child: Image.network(
                  //                 'https://cdn.mos.cms.futurecdn.net/NCUcG3jyFCEidqXpfxBcch.jpg',
                  //                 fit: BoxFit.cover,
                  //                 height: 120,
                  //                 width: 120,
                  //               ),
                  //             ),
                  //           ),
                  //         Column(
                  //           children: [
                              
                  //           ],
                  //         )
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarContainer(),
    );
  }
}
