import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc/profile/bloc/profile_bloc.dart';
import 'package:test_bloc/profile/bloc/profile_event.dart';
import 'package:test_bloc/profile/bloc/profile_state.dart';
import 'package:test_bloc/profile/repo/profile_model.dart';
import 'package:test_bloc/profile/repo/profile_repo.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  var _blankFocusNode = new FocusNode();

  String token;
  User user;

  getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
  }

  ProfileBloc profileBloc;

  final msg = BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) {
      if (state is ProfileInitialState) {
        return Text('init State Here From New One');
      } else if (state is UserSaveChangesSucessState) {
        return Text('User Did It Perfect Bro');
      }
    },
  );

  @override
  void initState() {
    // TODO: implement initState
    getPref();
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        body: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is UserSaveChangesSucessState) {
              user = state.profile;
              print('Hello From Pressing The Save Changes');
            }
          },
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_blankFocusNode);
            },
            child: SafeArea(
              child: Container(
                  padding: EdgeInsets.all(25),
                  color: Color(0xFFF9FAFF),
                  child: Column(
                    children: [
                      header(),
                      Expanded(
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.357,
                                  height: MediaQuery.of(context).size.height *
                                      0.200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xFFECF0F9),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Center(
                                    child: (_imageFile == null)
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image(
                                              fit: BoxFit.cover,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.387,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.190,
                                              image: FileImage(
                                                File(
                                                  _imageFile.path,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                FlatButton.icon(
                                  onPressed: () {
                                    imageProfile(context);
                                  },
                                  icon: Icon(Icons.camera_alt_outlined),
                                  label: Text('Uploade A Photo'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  color: Color(0xFFECF0F9),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            buildContainer('First Name', '${user.firstName}'),
                            buildContainer('Last Name', '${user.lastName}'),
                            buildContainer('Company Name (Optional)',
                                '${user.companyName}'),
                            tiile(
                              'Email Address',
                              '${user.email}',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            tiile('Mobile Number', '${user.phone}'),
                            SizedBox(
                              height: 20,
                            ),
                            changePassword(),
                            SizedBox(
                              height: 20,
                            ),
                            saveChanges(),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }

  toast() {
    Fluttertoast.showToast(
      msg: "Sucess",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
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

  Widget tiile(String lab, String text) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            lab,
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ),
        ListTile(
          tileColor: Color(0xFFECF0F9),
          trailing: Text(
            'Change',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4B0082),
            ),
          ),
          title: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 15,
              ),
              hintText: text,
            ),
          ),
        )
      ],
    );
  }

  Widget header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "My Profile ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
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
              width: MediaQuery.of(context).size.width / 14,
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
          height: 30,
        ),
      ],
    );
  }

  Widget buildContainer(String lab, String txt) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            lab,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFECF0F9),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget buildTextField(String lab, String hint) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            lab,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          width: 370,
          height: 50,
          // color: Colors.grey.shade200,

          decoration: BoxDecoration(
            color: Color(0xFFECF0F9),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10, bottom: 18),
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontSize: 15,
              ),
              hintText: hint,
              suffixIcon: Text(
                'Change',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4B0082),
                ),
              ),
              suffixStyle: TextStyle(fontSize: 28),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget changePassword() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 14,
      child: ElevatedButton(
        // onPressed: !isLoading
        //     ? () async {
        //   if (!phoneKey.currentState
        //       .validate()) {
        //     print("Error Format");
        //   } else {
        //     setState(() {
        //       isLoading = true;
        //     });
        //     var result = await Provider.of<
        //         UserViewModel>(
        //       context,
        //       listen: false,
        //     ).check(
        //       "20-${PhoneNumberController.text}",
        //     );
        //     setState(() {
        //       isLoading = false;
        //     });
        //     if (result) {
        //       savePref(
        //           "20-${PhoneNumberController.text}",
        //           "${PhoneNumberController.text}");
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) =>
        //               newEnterPassword(
        //                 value:
        //                 ("20-${PhoneNumberController.text}"),
        //               ),
        //         ),
        //       );
        //     } else {
        //       savePref(
        //           "20-${PhoneNumberController.text}",
        //           "${PhoneNumberController.text}");
        //       Fluttertoast.showToast(
        //         msg: "User not found",
        //         toastLength:
        //         Toast.LENGTH_SHORT,
        //         gravity:
        //         ToastGravity.BOTTOM,
        //         timeInSecForIosWeb: 1,
        //         backgroundColor:
        //         Colors.grey,
        //         textColor: Colors.white,
        //         fontSize: 16.0,
        //       );
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) =>
        //               SignUp(),
        //         ),
        //       );
        //     }
        //   }
        // }
        //     : null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Color(0xFF4B0082),
                width: 1.5,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            // Color(0xFF4B0082),
            Colors.white,
          ),
        ),
        child: Text(
          // LocaleKeys.next.tr(),
          'Change Password',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF4B0082),
          ),
        ),
      ),
    );
  }

  Widget saveChanges() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 14,
      child: ElevatedButton(
        onPressed: () {
          // ProfileBloc.get(context).add(
          //   SaveProfileChanges(token),
          profileBloc.add(
            SaveProfileChanges(token),
          );
        },
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
          'Save Changes',
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void imageProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: ((builder) => bottomSheet()),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text('Camera'),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(
                    ImageSource.gallery,
                  );
                },
                icon: Icon(Icons.image),
                label: Text('Galary'),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
