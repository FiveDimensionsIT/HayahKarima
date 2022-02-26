import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/translation/app_text.dart';
import 'package:hayah_karema/main.dart';
import 'package:hayah_karema/services/firebase_phone_auth/i_firebase_phone_auth.dart';
import 'package:hayah_karema/utils/ui/ui_lib.dart';

class FirebasePhoneAuth implements IFirebasePhoneAuth {

  String? _verificationId;
  int? _resendToken;

  @override
  Future authenticatePhone({required String countryCode,
    required String phoneNumber,
    required Function onVerificationCompleted,
    required Function onCodeSent,
    required Function onFailed}) async{
    //
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(minutes: 2),
      phoneNumber: "$countryCode$phoneNumber",
      verificationCompleted: (PhoneAuthCredential credential) {
        if(BUILD_TYPE != BuildType.release) debugPrint("==>> ## Phone Verification Completed ##");
        onVerificationCompleted(credential);
      },
      codeSent: (String verificationId, int? resendToken) {
        if(BUILD_TYPE != BuildType.release) debugPrint("==>> ## code SMS sent success ##");
        _verificationId = verificationId;
        _resendToken = resendToken;
        onCodeSent();
      },
      forceResendingToken: _resendToken,
      codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
      verificationFailed: (FirebaseAuthException e){
        onFailed();
        _onVerificationFailed(e);
      },
    );
    //
    return true;
  }

  @override
  Future verifySMSCode({required String code, required Function onCodeVerified}) async {
    final credential = PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: code);
    try {
      final user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      final currentUser = FirebaseAuth.instance.currentUser;
      if (user?.uid == currentUser?.uid) {
        onCodeVerified(true);
      } else{
        onCodeVerified(false);
        OverlayHelper.showErrorToast(AppText.invalidVerificationCode);
      }
    } catch (ex) {
      if(BUILD_TYPE != BuildType.release) debugPrint("==>> verifySMSCode : ## invalid verification code ## $ex");
      onCodeVerified(false);
      OverlayHelper.showErrorToast(AppText.invalidVerificationCode);
    }
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    OverlayHelper.showErrorToast(AppText.invalidMobileNumber);
    if(BUILD_TYPE != BuildType.release) debugPrint('==> _onVerificationFailed ${e.message}');
  }

  void _onCodeAutoRetrievalTimeout(String verificationId) {
    OverlayHelper.showErrorToast('Code auto retrieval timeout. please, resend code again');
    if(BUILD_TYPE != BuildType.release) debugPrint('==> _onCodeAutoRetrievalTimeout Error');
  }

}
