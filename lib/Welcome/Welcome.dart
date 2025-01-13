import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../LogIn/LogIn.dart';
import '../SignUp/SignUp.dart';
import '../constants.dart'; // Import Google Fonts

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimaryColor, // Set the background color to red
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2), // Space added at the top for better alignment
            // Logo
            Image.asset(
              'assets/images/caltex-logo1.png', // Replace with your logo asset
              height: 150,

            ),
            SizedBox(height: 60),
            Text(
              'LOYALTY',
              style: GoogleFonts.anton(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              'Club',
              style: GoogleFonts.anton(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            Spacer(flex: 3), // Space added between title and button
            // Sign Up Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set the button color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Color(0xFF004D61), // Text color inside the button
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Already have an account?
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(flex: 2), // Space added at the bottom
          ],
        ),
      ),
    );
  }
}
