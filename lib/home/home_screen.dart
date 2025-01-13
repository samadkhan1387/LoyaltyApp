import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/LogIn/LogIn.dart';
import '../History/History.dart';
import '../MarketPlace/MarketPlace.dart';
import '../Profile/Profile.dart';
import '../QrCode/QrCode.dart';
import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages corresponding to the selected index
  static List<Widget> _widgetOptions = <Widget>[
    Body(),
    MarketPlacePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor, // This matches your primary color.
        elevation: 0, // Remove the shadow under the AppBar for a flat look.
        leading: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer on icon press
            },
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
        child: Column(
          children: [
            // Centered Drawer Header
            // Full-width Drawer Header with Red Background
            Container(
              width: double.infinity,  // Ensure the header covers the full width of the drawer
              decoration: BoxDecoration(
                color: kPrimaryColor, // Set the background color to red
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0), // Adjust padding to control the spacing
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40, // Adjusted radius to center the avatar
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: kPrimaryColor, // Match the icon color with the header background
                    ),
                  ),
                  SizedBox(height: 10), // Spacing between avatar and name
                  Text(
                    "Abdul Samad",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  Text(
                    "ID-03XX-XXXXXXX",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15
                    ),
                  ),
                ],
              ),
            ),
            // List of Menu Items
            Expanded(
              child: Container(
                color: Color(0xFF004D61), // Set the background color here
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _createDrawerItem(
                      icon: Icons.fastfood, // Built-in food icon
                      text: 'Food',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.shopping_bag, // Built-in clothes icon
                      text: 'Clothes',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.local_grocery_store, // Built-in grocery icon
                      text: 'Grocery',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.card_giftcard, // Built-in vouchers icon
                      text: 'Vouchers',
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: Colors.white), // Set the divider color to white for contrast
                    ),
                    // Separate ListTiles for each item
                    _createDrawerItem(
                      icon: Icons.question_answer, // Built-in FAQs icon
                      text: 'FAQs',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.contact_phone, // Built-in contact us icon
                      text: 'Contact us',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.feedback, // Built-in feedback icon
                      text: 'Send Feedback',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.gavel, // Built-in legal icon
                      text: 'Legal',
                      onTap: () {},
                    ),
                    _createDrawerItem(
                      icon: Icons.logout, // Built-in logout icon
                      text: 'Logout',
                      onTap: () {},
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          'Delete Account',
                          style: TextStyle(color: Colors.white), // Set text color to white
                        ),
                      ),
                      minVerticalPadding: 0.0, // Set min vertical padding to zero
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.60, // Reduce the drawer width
      ), // Attach the drawer to the Scaffold
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      color: kPrimaryColor.withOpacity(0.2), // Adjust shadow color
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: kPrimaryColor,
                  selectedItemColor: kTextColor,
                  unselectedItemColor: Colors.white,
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: _selectedIndex == 0 ? kTextColor : Colors.white,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.store,
                        color: _selectedIndex == 1 ? kTextColor : Colors.white,
                      ),
                      label: "Marketplace",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.history,
                        color: _selectedIndex == 2 ? kTextColor : Colors.white,
                      ),
                      label: "History",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: _selectedIndex == 3 ? kTextColor : Colors.white,
                      ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -35, // Adjust to place the button above the bar
              left: 0,
              right: 0,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      backgroundColor: kTextColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRScannerScreen()),
                        );
                      },
                      child: Icon(Icons.qr_code_scanner,
                          color: Colors.white, size: 30), // Use the scan icon here
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0), // Adjusted padding
      leading: Icon(
        icon,
        color: Colors.white, // Ensure the icon color is white
        size: 32,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white), // Set the text color to white
      ),
      minLeadingWidth: 0, // Adjust the leading width to reduce the spacing
      minVerticalPadding: 0.0, // Set min vertical padding to zero
      onTap: onTap,
    );
  }
}
