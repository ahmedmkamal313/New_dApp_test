import 'package:flutter/material.dart'; // Flutter framework for building UI.
import 'package:web3pp/screens/wallet_generate_screen.dart'; // Screen for creating a new wallet.
import 'package:web3pp/screens/wallet_import_screen.dart'; // Screen for importing a new wallet screen.

class WalletOptionsScreen extends StatelessWidget {
  const WalletOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Welcome To Kaboria',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // First SizedBox - Space after the welcome text
            const SizedBox(height: 24),

            // Logo Container
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                width: 150,
                height: 200,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Second SizedBox - Space after the logo
            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: context => const Wallet) )
              }
            
          ],
        ),
      ),
    );
  }
}
