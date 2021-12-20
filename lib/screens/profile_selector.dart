import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  late int selectedValue;

  void initState(){
    super.initState();
    selectedValue =0;
  }

  setSelectedValue(int val){
    setState(() {
      selectedValue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 190.0,bottom: 20.0),
                child: Text(
                  "Please Select your profile",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                borderOnForeground: true,
                shadowColor: Colors.black,
                margin: EdgeInsets.all(10.0),
                child: RadioListTile(
                  selectedTileColor: Colors.blue,
                  dense: true,
                  value: 1,
                  groupValue: selectedValue,
                  title: Text(
                    "Shipper",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  subtitle: Text(
                    "Lorem ipsum dolor sit amet,"
                        "consectetur adipiscing",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  onChanged: (int? val){
                    setSelectedValue(val!);
                  },
                  activeColor: Colors.blue,
                  secondary: ShipperAsset(),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 2.0,
                borderOnForeground: true,
                shadowColor: Colors.black,
                margin: EdgeInsets.all(10.0),
                child: RadioListTile(
                value: 2,
                groupValue: selectedValue,
                title: Text(
                  "Transporter",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700
                  ),
                ),
                subtitle: Text(
                  "Lorem ipsum dolor sit amet,"
                      "consectetur adipiscing",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700
                  ),
                ),
                onChanged: (int? val){
                  setSelectedValue(val!);
                },
                activeColor: Colors.blue,
                secondary: TransporterAsset(),
              ),
              ),
              ContinueButton()
            ],
          ),
        ),
      ),
    );
  }
}


class ShipperAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/shipper.png');
    Image image = Image(
      image: assetImage,
      width: 50.0,
      height: 50.0,
    );
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: image);
  }
}

class TransporterAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/transporter.png');
    Image image = Image(
      image: assetImage,
      width: 50.0,
      height: 50.0,
    );
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: image);
  }
}

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        padding:
        EdgeInsets.only(top: 15.0, right: 130.0, left: 130.0, bottom: 15.0),
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
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context){
          //   return Otp();
          }));
        }
  }

