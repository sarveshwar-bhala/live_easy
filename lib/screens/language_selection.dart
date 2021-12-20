import 'package:flutter/material.dart';
import 'package:live_easy/screens/login.dart';
import 'package:live_easy/screens/login_screen.dart';

class LanguageSelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LanguageSelection();
  }
}

class _LanguageSelection extends State<LanguageSelection> {
  var _language = [
    'English',
    'Hindi',
    'French',
    'Urdu',
    'German',
    'Spanish',
    'Portugal',
    'Persian'
  ];
  var _currentLanguageSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // ),
      body: Center(
        child: Container(
          color: Colors.white,
          // margin: EdgeInsets.only(top : 150.0),
          alignment: Alignment.center,
          // padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: ImageAsset(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  "Please select your language",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 27.0,
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
                  "You can change the language "
                  "at any time",
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
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
                padding: EdgeInsets.only(top: 5.0, right: 50.0, left: 50.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 6.0, left: 16.0, right: 16.0, bottom: 6.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.zero),
                  child: DropdownButton<String>(
                    iconSize: 36.0,
                    iconEnabledColor: Colors.grey,
                    isExpanded: true,
                    alignment: Alignment.center,
                    elevation: 5,
                    items: _language.map((String dropDownItems) {
                      return DropdownMenuItem(
                          value: dropDownItems, child: Text(dropDownItems));
                    }).toList(),
                    onChanged: (String? newLanguageSelected) {
                      _dropDownItems(newLanguageSelected!);
                    },
                    hint: Text("Select Language"),
                    value: _currentLanguageSelected,
                    style: TextStyle(color: Colors.black, fontSize: 22.0),
                  ),
                ),
              ),
              NextButton(),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: BottomImageAsset(),
              )

            ],
          ),
        ),
      ),
    );
  }

  void _dropDownItems(String newValueSelected) {
    setState(() {
      _currentLanguageSelected = newValueSelected;
    });
  }

  void navigateToLoginPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LoginScreen();
    }));
  }
}

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('images/img.png');
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );
    return Container(child: image);
  }
}

class BottomImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/bottom3.png');
    Image image = Image(
      image: assetImage,
      width: 700.0,
      height: 200.0,
      fit: BoxFit.fill,

    );
    return Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: image,
    );
  }
}

// class BottomImageAsset2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     AssetImage assetImage = AssetImage('images/bottom2.png');
//     Image image = Image(
//       image: assetImage,
//       width: 700.0,
//       height: 200.0,
//       fit: BoxFit.fill,
//     );
//     return Container(
//       child: image,
//     );
//   }
// }

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: RaisedButton(
        padding:
            EdgeInsets.only(top: 15.0, right: 124.0, left: 124.0, bottom: 15.0),
        color: Color(0xff2e3b62),
        child: Text(
          'Next',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700),
        ),
        elevation: 5,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return LoginScreen();
          }));
        },
      ),
    );
  }
}


