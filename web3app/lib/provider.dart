import 'package:flutter/material.dart'; // Flutter framework for building UI.
import 'package:web3dart/web3dart.dart'; // Library for interacting with Ethereum blockchain.
import 'package:bip39/bip39.dart'
    as bip39; // Library for generating mnemonic phrases.
import 'package:ed25519_hd_key/ed25519_hd_key.dart'; // Library for key derivation.
import 'package:hex/hex.dart'; // Library for hex encoding/decoding.
import 'package:flutter/foundation.dart'; // Library for Flutter framework essentials.
import 'package:shared_preferences/shared_preferences.dart';

/// Abstract class defining the blueprint for wallet address services.
abstract class WalletAddressService {
  /// Method to generate a mnemonic phrase.
  String generateMnemonic();

  /// Method to derive a private key from a mnemonic phrase.
  Future<String> getPrivateKey(String mnemonic);

  /// Method to derive a public key (Ethereum address) from a private key.
  Future<EthereumAddress> getPublicKey(String privateKey);
}

/// Concrete implementation of WalletAddressService.
class WalletProvider extends ChangeNotifier implements WalletAddressService {
  /// Variable for the private key
  String?
      privateKey; // This variable stores the private key. The '?' means it can be nullable.

  /// Method to load the private key from shared preferences.
  Future<void> loadPrivateKey() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Getting an instance of SharedPreferences.
    privateKey = prefs.getString(
        'privateKey'); // Retrieving the private key stored under the key 'privateKey'.
  }

  /// Method to set and store the private key in shared preferences.
  Future<void> setPrivateKey(String privateKey) async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Getting an instance of SharedPreferences.
    await prefs.setString('privateKey',
        privateKey); // Storing the private key under the key 'privateKey'.
    notifyListeners(); // Notifying listeners to update the UI or perform necessary actions.
  }

  @override
  String generateMnemonic() {
    // Generate a mnemonic phrase using the bip39 library.
    return bip39.generateMnemonic();
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    // Derive the seed from the mnemonic phrase.
    final seed = bip39.mnemonicToSeed(mnemonic);
    // Derive the master key from the seed using ED25519.
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    // Encode the private key in hex format.
    final privateKey = HEX.encode(master.key);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicKey(String privateKey) async {
    // Create an Ethereum private key object from the hex-encoded private key.
    final private = EthPrivateKey.fromHex(privateKey);
    // Derive the public key (Ethereum address) from the private key.
    final address = await private.address;
    return address;
  }
}
