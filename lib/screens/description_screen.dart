import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_share/flutter_share.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final List<String> imgList = [
    'assets/1.jpg',
    'assets/3.jpg',
    'assets/1.jpg',
    'assets/3.jpg',
  ];
  final CarouselController _controller = CarouselController();
  Future<void> share() async {
    await FlutterShare.share(
      title: 'Example share',
      text: 'Check out this amazing surf session!',
      linkUrl: 'https://flutter.dev/',
      chooserTitle: 'Example Chooser Title',
    );
  }

  int _current = 0;
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
        title: Text('Description'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  CarouselSlider(
                    items: imgList
                        .map((item) => Container(
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 75.0,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.white)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.star)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite)),
                        IconButton(onPressed: share, icon: Icon(Icons.share)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.bookmark,
                    color: Colors.indigo.shade900,
                  ),
                  Text('1034'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.favorite, color: Colors.indigo.shade900),
                  Text('1034'),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Actor Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Indian Actress'),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 4),
                      Text('Duration 20 Mins'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet),
                      SizedBox(width: 4),
                      Text('Total Average Fees ₹9,999'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'About',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Implement see more action
                      },
                      child: Text('See More'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
