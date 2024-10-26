import 'package:flutter/material.dart';
import 'package:web3pp/provider.dart';
import 'package:provider/provider.dart';
import 'wallet.dart';
import 'wallet_onboarding_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    if (walletProvider.privateKey == null) {
      return const WalletOptionsScreen();
    } else {
      return walletScreen();
    }
  }
}
