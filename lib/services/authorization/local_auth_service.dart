
import 'package:local_auth/local_auth.dart';

class LocalAuthService{

  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    return canAuthenticateWithBiometrics || await auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await auth.authenticate(
        localizedReason: "Authenticate");
  }


}

/*

Code for faceID

  _checkLocalAuth() async {
    log("Auth");
    final auth = LocalAuthService();
    final bool isLocalAuthAvailable = await auth.isBiometricAvailable();

    if(isLocalAuthAvailable){
      final authenticated = await auth.authenticate();
      if(!authenticated){
        log("Failure");
      }else{
        log("Success");
        if(!mounted) return;
        _navigate();
      }
    }
  }

 */