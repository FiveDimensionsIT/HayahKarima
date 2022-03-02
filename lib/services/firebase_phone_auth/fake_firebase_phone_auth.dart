import 'package:hayah_karema/services/firebase_phone_auth/i_firebase_phone_auth.dart';


class FakeFirebasePhoneAuth implements IFirebasePhoneAuth{
  @override
  Future authenticatePhone({required String countryCode,
    required String phoneNumber,
    required Function onVerificationCompleted,
    required Function onCodeSent,
    required Function onFailed}) async{
    //
    await Future.delayed(const Duration(seconds: 2));
    /// phone number verified no need to enter received (SMS) code
    // onVerificationCompleted();

    /// code sent to SMS
    onCodeSent();

    // throw exception.
    // onFailed();
    return true;
  }

  @override
  Future verifySMSCode({required String code, required Function onCodeVerified}) async{
    //
    await Future.delayed(Duration(seconds: 2));
    //
    onCodeVerified(true);
    //
    return true;
  }

}