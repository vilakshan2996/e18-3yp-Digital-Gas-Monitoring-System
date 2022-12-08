import 'package:bluetoothapp/app/modules/login/views/otp_view.dart';
import 'package:bluetoothapp/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoggedIn = false.obs;
  

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> verifyPhoneNumber() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+94773785263',
    verificationCompleted: (PhoneAuthCredential credential) async {
    // ANDROID ONLY!
    print('.......AutomaticNumberVerification........');
    // Sign the user in (or link) with the auto-generated credential
    await _auth.signInWithCredential(credential);
  },
    verificationFailed: (FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      print('The provided phone number is not valid.');
    }

    // Handle other errors
  },
    codeSent: (String verificationId, int? resendToken) async {
    print('.......CodeIsSent........');
    var smsCode = await Get.to(OtpView());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    // Sign the user in (or link) with the credential
    _auth.signInWithCredential(credential).then((UserCredential result) {
      Get.offAllNamed(Routes.HOME);

    }).catchError((e){
      print(e);
    });



    
  },
  timeout: const Duration(seconds: 60),
    codeAutoRetrievalTimeout: (String verificationId) {},
  );


  

  }
  


 


}
