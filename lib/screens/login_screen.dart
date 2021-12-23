import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:live_easy/screens/profile_selector.dart';

import 'language_selection.dart';
import 'login.dart';
import 'otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';



enum MobileVerificationState {
  SHOW_MOBILE_FROM_STATE,
  SHOW_OTP_FROM_STATE
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();

}

class _LoginScreen extends State<LoginScreen> {

  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FROM_STATE;
  TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController _pinPutController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  late String _verificationCode;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  bool showLoading = false;

  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async{

    try{
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if(authCredential.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
      }

    }on FirebaseAuthException catch (e){
      setState(() {
        showLoading = false;
      });
      
      _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(e.message!)));
    }

  }



  getMobileFormWidget(context) {
    return Center(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(

          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CloseImageAsset(),
                  )

              ),
              const Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Text(
                  "Please enter your mobile number",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5.0, right: 60.0, left: 60.0),
                child: Text(
                  "You will receive 4 digit code "
                      "to verify next",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 30.0, left: 30.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 20.0
                  ),
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      labelText: "Mobile Number",
                      hintText: 'Mobile Number',
                      prefixIcon: FlagAsset(),
                      isDense: true,
                      prefixText: '+91   -    ',
                      prefixStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      )
                  ),
                  maxLength: 13,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  child: RaisedButton(
                    padding:
                    EdgeInsets.only(
                        top: 15.0, right: 115.0, left: 115.0, bottom: 15.0),
                    color: Color(0xff2e3b62),
                    child: Text(
                      'Continue',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700),
                    ),
                    elevation: 5,
                    onPressed: () async {
                      setState(() {
                        showLoading = true;
                      });
                      await _auth.verifyPhoneNumber(
                          phoneNumber: phoneNumberController.text,
                          verificationCompleted: (phoneAuthCredential) async{
                            setState(() {
                              showLoading =false;
                            });
                            // signInWithPhoneAuthCredential(phoneAuthCredential);

                          },
                          verificationFailed: (verificationFailed) async{
                            setState(() {
                              showLoading = false;
                            });
                            _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(verificationFailed.message!)));
                          },
                          codeSent: (verificationId,resendingCode) async{
                            setState(() {
                              showLoading =false;
                              currentState = MobileVerificationState.SHOW_OTP_FROM_STATE;
                              _verificationCode = verificationId;

                            });


                          },
                          codeAutoRetrievalTimeout: (verificationId) async{

                          }
                      );
                    },
                  ),
                ),
              ),
              BottomImageAssetLogin()
            ],
          ),
        ),
      ),
    );
  }

  getOtpFormWidget(context) {
    return Center(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: BackImageAsset(),
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 90.0),
                child: Text(
                  "Verify Phone",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "Code is sent to ${phoneNumberController.text.trim()}",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black54,
                    // decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: PinPut(
                    fieldsCount: 6,
                    // onSubmit: (String pin) => _showSnackBar(pin, context),
                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.deepPurpleAccent.withOpacity(.5),
                      ),
                    ),
                    onSubmit: (pin) async {

                    }),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 33.0),
                    child: Text(
                      "Didn't receive the code?",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                        decoration: TextDecoration.none,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: GestureDetector(
                        child: Text(
                          "Request Again",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Otp Requested'),
                                  content: Text('Otp Successfully Sent'),
                                );
                              });
                        },
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  child: RaisedButton(
                    padding:
                    EdgeInsets.only(top: 15.0, right: 90.0, left: 90.0, bottom: 15.0),
                    color: Color(0xff2e3b62),
                    child: Text(
                      'Verify And Continue',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700),
                    ),
                    elevation: 5,
                    onPressed: () async {
                      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: _verificationCode, smsCode: _pinPutController.text);
                      signInWithPhoneAuthCredential(phoneAuthCredential);
                    },
                  ),
                ),
              ),
              BottomImageAssetOtp()
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: showLoading ? Center(child: CircularProgressIndicator(),) :  currentState == MobileVerificationState.SHOW_MOBILE_FROM_STATE ?
      getMobileFormWidget(context) :
      getOtpFormWidget(context),
    );
  }


}
