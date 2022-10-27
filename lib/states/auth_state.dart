import 'package:cabgo_driver/request/user.dart';
import 'package:flutter/material.dart';

import '../exceptions/locationErrors.dart';

class AuthState with ChangeNotifier {
  //verify
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  TextEditingController textController5 = TextEditingController();

  Future<void> verifyOtpPasswordReset() async {
    try {
      String otpCode = textController1.text;
      otpCode += textController2.text;
      otpCode += textController3.text;
      otpCode += textController4.text;
      otpCode += textController5.text;

      await ApiClient().verifyOtpPasswordReset(
        resetPhoneNumber.text,
        otpCode,
      );
      clearController();
    } catch (e) {
      throw OtpVerificationError();
    }
  }

  Future<void> verifyOtp() async {
    try {
      String otpCode = textController1.text;
      otpCode += textController2.text;
      otpCode += textController3.text;
      otpCode += textController4.text;
      otpCode += textController5.text;
      await ApiClient().verifyOtp(
        userRegisterPhone,
        otpCode,
      );

      clearController();
    } catch (e) {
      throw OtpVerificationError();
    }
  }

  void clearController() {
    textController1.clear();
    textController2.clear();
    textController3.clear();
    textController4.clear();
    textController5.clear();
    notifyListeners();
  }
}
