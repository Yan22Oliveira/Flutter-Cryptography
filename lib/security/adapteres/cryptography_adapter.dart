import 'package:encrypt/encrypt.dart' as crypto;

import '../interface/interface_cryptography.dart';

class CryptographyAdapter implements InterfaceCryptography {

  static final _key = crypto.Key.fromUtf8('encrypted password study .32size');
  //static final _key = cryptography.Key.fromLength(32);
  static final _iv = crypto.IV.fromLength(16);
  static final _encrypter = crypto.Encrypter(crypto.AES(_key));

  @override
  String encrypt(plainText){
    return _encrypter.encrypt(plainText, iv: _iv).base64.toString();
  }

  @override
  String decrypt(encrypted){
    final encryptedConvert = convertBase64StringToEncrypted(encrypted);
    return _encrypter.decrypt(encryptedConvert, iv: _iv);
  }

  crypto.Encrypted convertBase64StringToEncrypted(encrypted){
    return crypto.Encrypted.fromBase64(encrypted);
  }

}