import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Otp/Otp.dart';
import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for the text fields
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();

  // Form key to validate the form
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose the controllers when not needed to free up resources
    firstnameController.dispose();
    lastnameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    shopNameController.dispose();
    shopAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimaryColor, // Background color for the top section
      body: SafeArea(
        child: Form(
          key: _formKey,
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
              // Bottom Section with Form and Button
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        // Dealer Registration Text
                        Text(
                          'Dealer Registration:',
                          style: TextStyle(
                            color: Color(0xFF004D61),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        // First Name and Last Name Fields in a Row
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: firstnameController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person, color: kPrimaryColor),
                                  labelText: 'First Name*',
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
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: lastnameController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person, color: kPrimaryColor),
                                  labelText: 'Last Name*',
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
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Phone Field
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone, color: kPrimaryColor),
                            labelText: 'Phone*',
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
                              return 'Please enter your phone number';
                            } else if (value.length != 11) {
                              return 'Please enter a valid 11-digit phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        // Email Field
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: kPrimaryColor),
                            labelText: 'Email*',
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
                              return 'Please enter your email address';
                            }
                            final emailPattern =
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                            final regex = RegExp(emailPattern);
                            if (!regex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        // Shop Name Field
                        TextFormField(
                          controller: shopNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.shop, color: kPrimaryColor),
                            labelText: 'Shop Name*',
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
                            contentPadding: EdgeInsets.symmetric(horizontal: 8), // Adjusted horizontal padding
                          ),
                          cursorColor: Color(0xFF818285),
                          style: TextStyle(color: kTextColor),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the shop name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        // Shop Address Field
                        TextFormField(
                          controller: shopAddressController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city, color: kPrimaryColor),
                            labelText: 'Shop Address*',
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
                              return 'Please enter the shop address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        // Sign Up Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => OtpScreen()),
                                // );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:kPrimaryColor, // Set the button color to red
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 80),
                            ),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
