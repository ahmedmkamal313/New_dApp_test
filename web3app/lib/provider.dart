import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:bip39/bip39.dart';
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:flutter/foundation.dart'

abstract class WalletAddressService {
  String generateMnemonic();
  Future<String> getPrivateKey(String nemonic);
  Future<EthereumAddress> getPublicKey(String privateKey);
}

class WalletProvider extends ChangeNotifier implements WalletAddressService{

}