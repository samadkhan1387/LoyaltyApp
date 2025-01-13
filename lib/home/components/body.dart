import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import 'CarouselwithDots.dart';

class Body extends StatelessWidget {
  final List<Map<String, String>> pointsHistory = [
    {"points": "100", "date": "18-August-24 02:55", "type": "collected"},
    {"points": "50", "date": "10-August-24 02:55", "type": "redeemed"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        // Header with Search Box (Non-scrolling part)
        Container(
          margin: EdgeInsets.only(bottom: 15),
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: 36 + kDefaultPadding,
                ),
                height: size.height * 0.2 - 25,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Hi. Abdul Samad',
                      style: GoogleFonts.anton(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    Image.asset("assets/images/boy.png"),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/points.png", // Your PNG icon asset
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Total Points",
                            style: TextStyle(
                              color: Color(0xFF004D61),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "1200",
                        style: TextStyle(
                          color: Color(0xFF004D61),
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // The rest of the content (scrollable part)
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CarouselWithDots(imgList: [
                  'assets/images/image_1.jpeg',
                  'assets/images/image_2.jpeg',
                  'assets/images/image_3.jpeg',
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Activity",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "View More",
                                style: TextStyle(
                                  color: Color(0xFF004D61),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF004D61),
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ...pointsHistory.map((history) {
                        return _buildActivityItem(
                          history['points']!,
                          history['date']!,
                          history['type']!,
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Method to build each activity item
  Widget _buildActivityItem(String points, String date, String type) {
    final isCollected = type == "collected";
    final color = isCollected ? Colors.green : kPrimaryColor;
    final label = isCollected ? "Points Collected" : "Points Redeemed";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.redeem, color: color, size: 30),
                SizedBox(width: 10),
                Text(
                  points,
                  style: TextStyle(
                    color: color,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
