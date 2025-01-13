import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_app/constants.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController firstnameController =
      TextEditingController(text: "Abdul");
  final TextEditingController lastNameController =
      TextEditingController(text: "Samad");
  final TextEditingController emailController =
      TextEditingController(text: "samad3316khan@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "03XX-XXXXXXX");
  final TextEditingController dobController =
      TextEditingController(text: "09/07/2000");
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: double.infinity,
                    height: 90, // Adjust the height as needed
                    child: Column(
                      children: [
                        Text(
                          'Profile',
                          style: GoogleFonts.anton(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right:
                        30, // Adjust this value to control vertical positioning
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xFF004D61),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top:
                        100, // Adjust this value based on the avatar's position
                    right: MediaQuery.of(context).size.width *
                        0.12, // Center the edit icon on the avatar
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: kPrimaryColor,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              // Profile Form
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0,
                    20.0), // Adjust top padding to give space after avatar
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstnameController,
                            decoration: InputDecoration(
                              labelText: 'First Name*',
                              labelStyle: TextStyle(
                                color: Color(0xFF004D61),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(color: Color(0xFF004D61)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              labelText: 'Last Name*',
                              labelStyle: TextStyle(
                                color: Color(0xFF004D61),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(color: Color(0xFF004D61)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email*',
                        labelStyle: TextStyle(
                          color: Color(0xFF004D61),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: TextStyle(color: Color(0xFF004D61)),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'Phone Number*',
                              labelStyle: TextStyle(
                                color: Color(0xFF004D61),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(color: Color(0xFF004D61)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: dobController,
                            decoration: InputDecoration(
                              labelText: 'Date Of Birth*',
                              labelStyle: TextStyle(
                                color: Color(0xFF004D61),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Color(0xFF004D61),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            style: TextStyle(color: Color(0xFF004D61)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: shopNameController,
                      decoration: InputDecoration(
                        labelText: 'Shop Name*',
                        labelStyle: TextStyle(
                          color: Color(0xFF004D61),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: TextStyle(color: Color(0xFF004D61)),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: shopAddressController,
                      decoration: InputDecoration(
                        labelText: 'Shop Address*',
                        labelStyle: TextStyle(
                          color: Color(0xFF004D61),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xFF004D61),
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      style: TextStyle(color: Color(0xFF004D61)),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Save action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF004D61),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Text Field Widget with Label
  Widget _buildTextField(
      {required String label, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Color(0xFF004D61),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFF004D61),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFF004D61),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Color(0xFF004D61),
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      style: TextStyle(color: Color(0xFF004D61)),
    );
  }
}
