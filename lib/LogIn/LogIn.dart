import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/Otp/Otp.dart';
import '../constants.dart';
import '../home/home_screen.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
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
              // Bottom Section with Phone Number Input and Login Button
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Enter Phone Number',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Phone Number Input Field with Validation
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone, color: kPrimaryColor),
                          labelText: '03XX-XXXXXXX',
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
                            return 'Please enter your phone number.';
                          } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                            return 'Please enter a valid 11-digit phone number.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      // Custom Numeric Keypad
                      _buildCustomKeypad(),
                      SizedBox(height: 10),
                      // Login Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OtpScreen()),
                              );
                              print('Phone number: ${_phoneController.text}');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 80),
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Numeric Keypad with Larger Buttons
  Widget _buildCustomKeypad() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5, // Adjust to change height/width ratio
        mainAxisSpacing: 0, // Space between rows
        crossAxisSpacing: 10, // Space between columns
      ),
      itemBuilder: (context, index) {
        if (index == 9) {
          return SizedBox.shrink(); // Empty space for better layout
        } else if (index == 11) {
          return _buildKeypadButton(
            icon: Icons.backspace_outlined,
            onTap: () {
              if (_phoneController.text.isNotEmpty) {
                setState(() {
                  _phoneController.text = _phoneController.text.substring(
                    0,
                    _phoneController.text.length - 1,
                  );
                });
              }
            },
          );
        } else {
          return _buildKeypadButton(
            text: index == 10 ? '0' : '${index + 1}',
            onTap: () {
              if (_phoneController.text.length < 11) {
                setState(() {
                  _phoneController.text += index == 10 ? '0' : '${index + 1}';
                });
              }
            },
          );
        }
      },
    );
  }

  // Button Widget for Numeric Keypad with Increased Size
  Widget _buildKeypadButton({String? text, IconData? icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80, // Increase height
        width: 80,  // Increase width
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: text != null
              ? Text(
            text,
            style: TextStyle(
              fontSize: 30, // Increase font size
              fontWeight: FontWeight.bold,
              color: kTextColor,
            ),
          )
              : Icon(
            icon,
            size: 28, // Increase icon size
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}
