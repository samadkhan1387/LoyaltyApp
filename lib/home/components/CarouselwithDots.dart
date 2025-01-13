import 'dart:async';
import 'package:flutter/material.dart';

class CarouselWithDots extends StatefulWidget {
  final List<String> imgList;

  CarouselWithDots({required this.imgList});

  @override
  _CarouselWithDotsState createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  int _current = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_current < widget.imgList.length - 1) {
        _current++;
      } else {
        _current = 0;
      }

      _pageController.animateToPage(
        _current,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180, // Set the height of the carousel
          margin: EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0), // Apply the same border radius
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  itemCount: widget.imgList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      widget.imgList[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity, // Ensure image covers the entire area
                    );
                  },
                ),
                Positioned(
                  bottom: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imgList.map((url) {
                      int index = widget.imgList.indexOf(url);
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: _current == index ? 20.0 : 8.0, // Elongated width for active dot
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          color: _current == index
                              ? Colors.red  // Active dot color
                              : Color(0xFF004D61),  // Inactive dots color
                          borderRadius: BorderRadius.circular(8.0), // Circular for inactive, oval for active
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
