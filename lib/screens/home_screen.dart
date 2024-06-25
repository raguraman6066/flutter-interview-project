import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

import 'description_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Individual Meetup'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.mic),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Carousel slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 180.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              // Bottom dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 25),
              // Trending Popular People
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trending Popular People',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => people(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Top Trending Meetups',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 350,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DescriptionPage()));
                            },
                            child: meetup()),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: 2,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_cozy),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget meetup() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.only(right: 10),
        width: 200,
        height: 300,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/meet.jpg",
                )),
          ],
        ),
      ),
    );
  }

  Widget people() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 5),
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Author'),
                  Text(
                    '1,234 Meetups',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          Divider(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'See more',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
