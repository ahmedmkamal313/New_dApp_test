import 'package:flutter/material.dart'; // Flutter framework for building UI.
import 'package:provider/provider.dart'; // Library for state management.
import 'package:web3pp/provider.dart'; // Custom provider for wallet functionalities.

/// The main function is the entry point of the Flutter application.
void main() {
  runApp(
    ChangeNotifierProvider<WalletProvider>(
      create: (context) =>
          WalletProvider(), // Creating an instance of WalletProvider.
      child: const MyApp(), // The root widget of the application.
    ),
  );
}

/// MyApp is a StatelessWidget that serves as the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget.

  @override
  Widget build(BuildContext context) {
    // Accessing the WalletProvider instance.
    final walletProvider = Provider.of<WalletProvider>(context);
    return MaterialApp(
      title: 'Kaboria', // Title of the application.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple), // Setting a color scheme.
        useMaterial3: true, // Enabling Material 3 design.
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kaboria'), // Title of the app bar.
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Centering the column content vertically.
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Generating a new wallet when the button is pressed.
                  final mnemonic = walletProvider.generateMnemonic();
                  final privateKey =
                      await walletProvider.getPrivateKey(mnemonic);
                  final publickKey =
                      await walletProvider.getPublicKey(privateKey);
                  // You can add further actions here, like displaying the generated keys.
                },
                child: const Text('Create a new Wallet'), // Button label.
              ),
            ],
          ),
        ),
      ),
    );
  }
}
