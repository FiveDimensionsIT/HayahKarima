import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuth {

  Future authenticatePhone(
      {required String countryCode,
      required String phoneNumber,
      required Function onVerificationCompleted,
      required Function onCodeSent,
      required Function onFailed});

  Future verifySMSCode({required String code, required Function onCodeVerified});

  Future<UserCredential?> signInWithGoogle();

  Future<UserCredential?> signInWithFacebook();
}
