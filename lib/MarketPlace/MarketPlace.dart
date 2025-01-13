import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Food.dart';

import '../constants.dart';

class MarketPlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Points Section
          Container(
            color: Color(0xFF004D61),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Make sure the Column takes minimum height
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
          // Categories Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Categories',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        _buildCategoryItem(
                          context,
                          icon: Icons.fastfood_outlined,
                          label: 'Food',
                          onTap: () {
                            // Navigate to the FoodPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodPage()),
                            );
                          },
                        ),
                        _buildCategoryItem(
                          context,
                          icon: Icons.checkroom_outlined,
                          label: 'Clothes',
                          onTap: () {
                            // Navigate to the FoodPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodPage()),
                            );
                          },
                        ),
                        _buildCategoryItem(
                          context,
                          icon: Icons.local_grocery_store_outlined,
                          label: 'Grocery',
                          onTap: () {
                            // Navigate to the FoodPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodPage()),
                            );
                          },
                        ),
                        _buildCategoryItem(
                          context,
                          icon: Icons.card_giftcard_outlined,
                          label: 'Vouchers',
                          onTap: () {
                            // Navigate to the FoodPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodPage()),
                            );
                          },
                        ),
                        _buildCategoryItem(
                          context,
                          icon: Icons.settings_outlined,
                          label: 'Oil Change',
                          onTap: () {
                            // Navigate to the FoodPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FoodPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to create a category item with navigation
  Widget _buildCategoryItem(BuildContext context, {required IconData icon, required String label, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80, // Adjusted height
        width: 80, // Adjusted width
        decoration: BoxDecoration(
          color: Color(0xFF004D61),
          borderRadius: BorderRadius.circular(15), // Adjust border radius as needed
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40, // Adjusted icon size
              color: Colors.white,
            ),
            SizedBox(height: 5), // Spacing between icon and label
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14, // Adjusted font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
