import 'package:flutter/material.dart'; // Importing Flutter's material design package.
import 'package:provider/provider.dart'; // Importing provider package for state management.
import 'package:web3pp/provider.dart'; // Importing custom provider for wallet functionalities.
import 'package:web3pp/screens/wallet_screen.dart'; // Importing the wallet screen.

/// VerifyScreen is a StatefulWidget that handles the verification of a mnemonic phrase.
class VerifyScreen extends StatefulWidget {
  final String mnemonic; // The mnemonic phrase to be verified.

  const VerifyScreen({Key? key, required this.mnemonic})
      : super(key: key); // Constructor for VerifyScreen.

  @override
  _VerifyScreenState createState() =>
      _VerifyScreenState(); // Creating the state for the VerifyScreen.
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool isVerified =
      false; // Boolean to track if the mnemonic has been verified.
  String verificationText = ''; // Text entered by the user for verification.

  /// Method to verify the mnemonic phrase.
  void verifyMnemonic() {
    final walletProvider = Provider.of<WalletProvider>(context,
        listen: false); // Accessing the WalletProvider instance.
    if (verificationText.trim() == widget.mnemonic.trim()) {
      // Comparing the entered text with the mnemonic.
      walletProvider.getPrivateKey(widget.mnemonic).then((privateKey) {
        setState(() {
          isVerified = true; // Updating the state if the mnemonic is verified.
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Method to navigate to the WalletScreen.
    void navigateToWalletScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                WalletScreen()), // Pushing the WalletScreen onto the navigator stack.
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify and Create'), // Title of the app bar.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the body content.
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Centering the column content vertically.
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Stretching the column content horizontally.
          children: [
            const Text(
              'Please verify your mnemonic phrase:', // Instructional text.
              style: TextStyle(fontSize: 18.0), // Text style.
            ),
            const SizedBox(height: 24.0), // Spacer.
            TextField(
              onChanged: (value) {
                setState(() {
                  verificationText =
                      value; // Updating the verificationText as the user types.
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter mnemonic phrase', // Text field label.
              ),
            ),
            const SizedBox(height: 16.0), // Spacer.
            ElevatedButton(
              onPressed: () {
                verifyMnemonic(); // Verifying the mnemonic when the button is pressed.
              },
              child: const Text('Verify'), // Button label.
            ),
            const SizedBox(height: 24.0), // Spacer.
            ElevatedButton(
              onPressed: isVerified
                  ? navigateToWalletScreen
                  : null, // Navigating to WalletScreen if verified.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button background color.
                foregroundColor: Colors.black, // Button text color.
              ),
              child: const Text('Next'), // Button label.
            ),
          ],
        ),
      ),
    );
  }
}
