import 'package:flutter/material.dart';
import '../../../constants.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Text(
            'Recommended',
            style: TextStyle(
              fontSize: 18, // Set text size to 15
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Adjust padding to control size
              minimumSize: Size(70, 30), // Minimum size to ensure the button doesn't shrink too much
            ),
            onPressed: () {  },
            child: Text(
              "More",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15, // Set text size to 15
              ),
            ),
          ),

        ],
      ),
    );
  }
}
