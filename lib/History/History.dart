import 'package:flutter/material.dart';
import 'package:loyalty_app/constants.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> pointsHistory = [
    {"points": "20", "date": "15-August-24 02:55", "type": "collected"},
    {"points": "150", "date": "12-August-24 02:55", "type": "redeemed"},
    {"points": "100", "date": "11-August-24 02:55", "type": "collected"},
    {"points": "30", "date": "10-August-24 02:55", "type": "redeemed"},
    {"points": "80", "date": "12-August-24 02:55", "type": "collected"},
    {"points": "50", "date": "11-August-24 02:55", "type": "redeemed"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Points Summary Section
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPointsSummary('300', 'Available Points', Colors.green),
                _buildPointsSummary('500', 'Total Earn', Colors.black),
                _buildPointsSummary('300', 'Total Used', kPrimaryColor),
              ],
            ),
          ),
          Divider(height: 1),
          // Points History List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: pointsHistory.length,
              itemBuilder: (context, index) {
                final history = pointsHistory[index];
                return _buildHistoryItem(
                  history['points']!,
                  history['date']!,
                  history['type']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the points summary widgets
  Widget _buildPointsSummary(String points, String label, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          points,
          style: TextStyle(
            color: color,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Method to build each history item
  Widget _buildHistoryItem(String points, String date, String type) {
    final isCollected = type == "collected";
    final color = isCollected ? Colors.green : kPrimaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                  isCollected ? 'Points Collected' : 'Points Redeemed',
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
