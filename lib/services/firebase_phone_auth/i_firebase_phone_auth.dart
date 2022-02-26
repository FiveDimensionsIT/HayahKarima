abstract class IFirebasePhoneAuth {

  Future authenticatePhone(
      {required String countryCode,
      required String phoneNumber,
      required Function onVerificationCompleted,
      required Function onCodeSent,
      required Function onFailed});

  Future verifySMSCode({required String code, required Function onCodeVerified});
}
