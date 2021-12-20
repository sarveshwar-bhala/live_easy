import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_easy/screens/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:live_easy/screens/profile_selector.dart';


// class Login extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _Login();
//   }
// }
//
// class _Login extends State<Login> {
//   TextEditingController phoneNumberController = TextEditingController();
//   late String _verificationCode;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 28.0),
//                 child: GestureDetector(
//                   onTap: (){
//                     Navigator.pop(context);
//                   },
//                   child: CloseImageAsset(),
//                 )
//
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 70.0),
//                 child: Text(
//                   "Please enter your mobile number",
//                   textDirection: TextDirection.ltr,
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     color: Colors.black,
//                     decoration: TextDecoration.none,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 5.0, right: 60.0, left: 60.0),
//                 child: Text(
//                   "You will receive 4 digit code "
//                   "to verify next",
//                   textDirection: TextDirection.ltr,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 22.0,
//                     color: Colors.black54,
//                     decoration: TextDecoration.none,
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               Padding(
//                     padding: EdgeInsets.only(top: 10.0,right: 30.0,left: 30.0),
//                     child: TextField(
//                       keyboardType: TextInputType.number,
//                       style: TextStyle(
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                         fontSize: 20.0
//                       ),
//                       controller: phoneNumberController,
//                       decoration: InputDecoration(
//                         labelText: "Mobile Number",
//                         hintText: 'Mobile Number',
//                         prefixIcon: FlagAsset(),
//                         isDense: true,
//                         prefixText: '+91   -    ',
//                         prefixStyle: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 20.0
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.zero,
//                         )
//                       ),
//                       maxLength: 10,
//                     ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 10.0),
//                 child: Container(
//                   child: RaisedButton(
//                     padding:
//                     EdgeInsets.only(top: 15.0, right: 115.0, left: 115.0, bottom: 15.0),
//                     color: Color(0xff2e3b62),
//                     child: Text(
//                       'Continue',
//                       textDirection: TextDirection.ltr,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30.0,
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.w700),
//                     ),
//                     elevation: 5,
//                     onPressed: () async{
//
//                       await FirebaseAuth.instance.verifyPhoneNumber(
//                           phoneNumber: "+91${_Login().phoneNumberController}",
//                           verificationCompleted: (PhoneAuthCredential credential) async {
//                             await FirebaseAuth.instance
//                                 .signInWithCredential(credential)
//                                 .then((value) async {
//                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Profile()),
//                                       (route)=>false);
//                             });
//                           },
//                           verificationFailed: (FirebaseAuthException e) {
//                             print(e.message);
//                           },
//                           codeSent: (String verificationId, int? resendToken) {
//                             setState(() {
//                               _verificationCode = verificationId;
//                             });
//                           },
//                           codeAutoRetrievalTimeout: (String verificationId) {
//                             setState(() {
//                               _verificationCode = verificationId;
//                             });
//                           },
//                           timeout: Duration(seconds: 60));
//                     },
//                   ),
//                 ),
//               ),
//               BottomImageAssetLogin()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }

class CloseImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/cross.png');
    Image image = Image(
      image: assetImage,
      width: 30.0,
      height: 30.0,
    );
    return Container(
        padding: EdgeInsets.only(top: 50, right: 350.0), child: image);

  }
}
class FlagAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/flag.png');
    Image image = Image(
      image: assetImage,
      width: 30.0,
      height: 30.0,
    );
    return Container(
      padding: EdgeInsets.only(right: 10.0,left: 10.0),
        child: image);
  }
}

// class ContinueButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: RaisedButton(
//         padding:
//         EdgeInsets.only(top: 15.0, right: 115.0, left: 115.0, bottom: 15.0),
//         color: Color(0xff2e3b62),
//         child: Text(
//           'Continue',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 30.0,
//               fontFamily: 'Roboto',
//               fontWeight: FontWeight.w700),
//         ),
//         elevation: 5,
//         onPressed: () async{
//
//           await FirebaseAuth.instance.verifyPhoneNumber(
//               phoneNumber: "+91${_Login().phoneNumberController}",
//               verificationCompleted: (PhoneAuthCredential credential) async {
//                 await FirebaseAuth.instance
//                     .signInWithCredential(credential)
//                     .then((value) async {
//                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Profile()),
//                           (route)=>false);
//                 });
//               },
//               verificationFailed: (FirebaseAuthException e) {
//                 print(e.message);
//               },
//               codeSent: (String verificationId, int? resendToken) {
//                 setState(() {
//                   _verificationCode = verificationId;
//                 });
//               },
//               codeAutoRetrievalTimeout: (String verificationId) {
//                 setState(() {
//                   _verificationCode = verificationId;
//                 });
//               },
//               timeout: Duration(seconds: 60));
//         },
//       ),
//     );
//   }
// }


class BottomImageAssetLogin extends StatelessWidget {
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
      padding: EdgeInsets.only(top: 194.0),
      child: image,
    );
  }
}
