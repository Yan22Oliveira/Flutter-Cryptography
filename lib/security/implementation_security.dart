import './adapteres/cryptography_adapter.dart';
import './interface/interface_cryptography.dart';

class ImplementationSecurity extends InterfaceCryptography{

  final CryptographyAdapter cryptographyAdapter;
  ImplementationSecurity({required this.cryptographyAdapter});

  @override
  String encrypt(plainText){
    return cryptographyAdapter.encrypt(plainText);
  }

  @override
  String decrypt(encrypted){
    return cryptographyAdapter.decrypt(encrypted);
  }

}