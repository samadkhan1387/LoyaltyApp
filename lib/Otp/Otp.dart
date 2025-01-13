import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../home/home_screen.dart'; // Import the HomeScreen here

class OtpScreen extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();

  // GlobalKey to manage the form state
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor, // Background color for the top section
      body: SafeArea(
        child: Column(
          children: [
            // Top Section with Logo and Title
            Expanded(
              flex: 2,
              child: Container(
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      'CALTEX',
                      style: GoogleFonts.anton(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'LOYALTY CLUB',
                      style: GoogleFonts.anton(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Section with OTP Form and Submit Button
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: _formKey, // Assign the form key
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Enter OTP',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'We sent a code to 03XX-XXXXXXX',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20),
                      // OTP Text Field
                      TextFormField(
                        controller: _otpController,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.pin, color: kPrimaryColor),
                          labelText: '****',
                          labelStyle: TextStyle(color: kTextColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: kTextColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: kTextColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: kTextColor,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        cursorColor: Color(0xFF818285),
                        style: TextStyle(color: kTextColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the OTP';
                          }
                          if (value.length != 4) { // Assuming a 4-digit OTP
                            return 'Please enter a valid 4-digit OTP';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Handle resend OTP action
                          },
                          child: Text(
                            'Resend',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // If validation passes, navigate to the HomeScreen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
