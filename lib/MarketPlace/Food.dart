import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/constants.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Food', style: TextStyle( color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Points Section
          Container(
            color: Color(0xFF004D61),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  '300',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Available Points',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Food List Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  _buildFoodItem(
                    context,
                    label: 'Pizza One',
                    image: 'assets/images/food1.jpeg',
                    points: '150',
                  ),
                  _buildFoodItem(
                    context,
                    label: 'Domino',
                    image: 'assets/images/food2.jpeg',
                    points: '150',
                  ),
                  _buildFoodItem(
                    context,
                    label: 'Kababejees Restaurant',
                    image: 'assets/images/food3.jpeg',
                    points: '50',
                  ),
                  _buildFoodItem(
                    context,
                    label: 'Pizza One',
                    image: 'assets/images/food1.jpeg',
                    points: '150',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to create a food item
  Widget _buildFoodItem(BuildContext context, {required String label, required String image, required String points}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            // Label and Points Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.anton(
                      color: kTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$points Points',
                        style: TextStyle(
                          color: Color(0xFF004D61),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle the Buy button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        ),
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
