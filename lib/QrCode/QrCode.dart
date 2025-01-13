import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../constants.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRCodeScannerPageState createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Scan QR",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: kPrimaryColor,
                borderRadius: 10,
                borderLength: 15,
                borderWidth: 5,
                cutOutSize: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData.code);
      controller.pauseCamera();

      // Show the dialog with the points information
      _showPointsCollectedDialog(context, 200);
    });
  }


  void _showPointsCollectedDialog(BuildContext context, int points) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Custom PNG Image
                Image.asset(
                  'assets/images/redeem.png', // Replace with your image path
                  width: 110,
                  height: 110,
                  color: kTextColor,
                ),
                SizedBox(height: 16),
                Text(
                  '$points',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                Text(
                  'Points Collected',
                  style: TextStyle(
                    fontSize: 20,
                    color: kTextColor,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 180,  // Adjust button width
                  height: 50,  // Adjust button height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller?.resumeCamera(); // Resume the camera
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                        fontSize: 16,  // Adjust font size if needed
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
