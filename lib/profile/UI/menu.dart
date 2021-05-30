import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _blankFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(25),
              // color: Color(0xFFF9FAFF),
              color: Color(0xFFF9FAFF),

              child: Column(
                children: [
                  header(),
                  listtile('App Language', 'assets/language.png'),
                  SizedBox(
                    height: 15,
                  ),
                  listtile('Contact Us', 'assets/contact.png'),
                  SizedBox(
                    height: 15,
                  ),
                  listtile('Privacy Policy', 'assets/privacy.png'),
                  SizedBox(
                    height: 15,
                  ),
                  listtile('Terms Of Use', 'assets/terms.png'),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: saveChanges(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      // title: Image('assets/logo.png'),You can add title here
      title: Image(
        image: AssetImage(
          'assets/logo.png',
        ),
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.066,
      ),

      backgroundColor: Color(0xFFF9FAFF), //You can make this transparent
      elevation: 0.0, //No shadow
    );
  }

  Widget header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Main",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " menu",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              //   padding: EdgeInsets.only(top: 10),
              height: 4.0,
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0XFF4B0082),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              //   padding: EdgeInsets.only(top: 10),
              height: 4.0,
              width: MediaQuery.of(context).size.width / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.purple.shade200,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget listtile(String lab, String image) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 400,
      height: 55,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFECF0F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            lab,
            style: TextStyle(
              color: Color(0XFF4B0082),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget saveChanges() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.8,
      height: MediaQuery.of(context).size.height / 17,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFF4B0082),
          ),
        ),
        child: Text(
          // LocaleKeys.next.tr(),
          'Sign Out',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
