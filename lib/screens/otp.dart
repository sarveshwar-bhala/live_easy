import 'package:flutter/material.dart';
import 'package:live_easy/screens/profile_selector.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';

// class Otp extends StatefulWidget {
//   final String phone;
//
//   Otp(this.phone);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _Otp();
//   }
// }
//
// class _Otp extends State<Otp> {
//   final TextEditingController _pinPutController = TextEditingController();
//   final FocusNode _pinPutFocusNode = FocusNode();
//
//   BoxDecoration get _pinPutDecoration {
//     return BoxDecoration(
//       border: Border.all(color: Colors.black),
//       borderRadius: BorderRadius.circular(15.0),
//     );
//   }
//
//   late String _verificationCode;
//   final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           color: Colors.white,
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               Padding(
//                   padding: EdgeInsets.only(top: 30.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: BackImageAsset(),
//                   )),
//               const Padding(
//                 padding: EdgeInsets.only(top: 90.0),
//                 child: Text(
//                   "Verify Phone",
//                   textDirection: TextDirection.ltr,
//                   style: TextStyle(
//                     fontSize: 35.0,
//                     color: Colors.black,
//                     decoration: TextDecoration.none,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 5.0),
//                 child: Text(
//                   "Code is sent to +91-${widget.phone}",
//                   textDirection: TextDirection.ltr,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 22.0,
//                     color: Colors.black54,
//                     // decoration: TextDecoration.none,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: PinPut(
//                     fieldsCount: 6,
//                     // onSubmit: (String pin) => _showSnackBar(pin, context),
//                     focusNode: _pinPutFocusNode,
//                     controller: _pinPutController,
//                     submittedFieldDecoration: _pinPutDecoration.copyWith(
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     selectedFieldDecoration: _pinPutDecoration,
//                     followingFieldDecoration: _pinPutDecoration.copyWith(
//                       borderRadius: BorderRadius.circular(5.0),
//                       border: Border.all(
//                         color: Colors.deepPurpleAccent.withOpacity(.5),
//                       ),
//                     ),
//                     onSubmit: (pin) async {
//                       try {
//                         await FirebaseAuth.instance
//                             .signInWithCredential(PhoneAuthProvider.credential(
//                                 verificationId: _verificationCode,
//                                 smsCode: pin))
//                             .then((value) async {
//                           if (value.user != null) {
//                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Profile()),
//                                     (route)=>false);
//                           }
//                         });
//                       } catch (e) {
//                         FocusScope.of(context).unfocus();
//                         _globalKey.currentState!.showSnackBar(
//                             SnackBar(content: Text('invalid otp')));
//                       }
//                     }),
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 5.0, left: 33.0),
//                     child: Text(
//                       "Didn't receive the code?",
//                       textDirection: TextDirection.ltr,
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.black54,
//                         decoration: TextDecoration.none,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding: EdgeInsets.only(top: 5.0),
//                       child: GestureDetector(
//                         child: Text(
//                           "Request Again",
//                           textDirection: TextDirection.ltr,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20.0,
//                             color: Colors.black,
//                             decoration: TextDecoration.none,
//                             fontFamily: 'Roboto',
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   title: Text('Otp Requested'),
//                                   content: Text('Otp Successfully Sent'),
//                                 );
//                               });
//                         },
//                       )),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 20.0),
//                 child: VerifyAndContinueButton(),
//               ),
//               BottomImageAssetOtp()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: "+91${widget.phone}",
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Profile()),
//                 (route)=>false);
//               });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           setState(() {
//             _verificationCode = verificationId;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           setState(() {
//             _verificationCode = verificationId;
//           });
//         },
//         timeout: Duration(seconds: 60));
//   }
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   _verifyPhone();
//   // }
// }

class VerifyAndContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {
          // if(_Otp()._verifyPhone() == ){
          //
          // }

        },
      ),
    );
  }
}

class BackImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/back.png');
    Image image = Image(
      image: assetImage,
      width: 30.0,
      height: 30.0,
    );

    return Container(
        padding: EdgeInsets.only(top: 50, right: 350.0), child: image);
  }
}

class BottomImageAssetOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/bottom2.png');
    Image image = Image(
      image: assetImage,
      width: 700.0,
      height: 200.0,
      fit: BoxFit.fill,
    );
    return Padding(
      padding: EdgeInsets.only(top: 144.0),
      child: image,
    );
  }
}
