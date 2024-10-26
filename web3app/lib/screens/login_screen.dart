import 'package:flutter/material.dart'; // Importing Flutter's material design package.
import 'package:web3pp/provider.dart'; // Importing custom provider for wallet functionalities.
import 'package:provider/provider.dart'; // Importing provider package for state management.
import 'wallet.dart'; // Importing the wallet screen.
import 'wallet_onboarding_screen.dart'; // Importing the wallet onboarding screen.

/// LoginScreen is a StatelessWidget that manages the initial login state.
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key})
      : super(key: key); // Constructor for LoginScreen.

  @override
  Widget build(BuildContext context) {
    // Accessing the WalletProvider instance.
    final walletProvider = Provider.of<WalletProvider>(context);

    // Checking if the private key is null.
    if (walletProvider.privateKey == null) {
      // If the private key is null, navigate to the WalletOptionsScreen.
      return const WalletOptionsScreen();
    } else {
      // If the private key is not null, navigate to the WalletScreen.
      return walletScreen();
    }
  }
}
