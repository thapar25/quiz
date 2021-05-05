import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:quiz/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  TextEditingController phoneController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  String phoneNumber = "";
  String code = "91";
  String number = "";
  String username = "";

  void printDetails() {
    phoneNumber = "+" + this.code.toString() + phoneController.text.toString();
    print(nameController.text);
    print(phoneNumber);
  }

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Login Page"),
        ),
        body: Container(
          child: (SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: kPrimaryLightColor,
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter name'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Choose country : '),
                        Opacity(
                          opacity: 0.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              onPrimary: kPrimaryLightColor,
                            ),
                            onPressed: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  this.code = country.phoneCode;
                                  print('Select country: ${country.phoneCode}');
                                },
                              );
                            },
                            child: Text('country'),
                          ),
                        )
                      ]),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(10)
                    ],
                    controller: phoneController,
                    /*
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    */

                    decoration: InputDecoration(
                        filled: true,
                        fillColor: kPrimaryLightColor,
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        hintText: 'Enter 10-digit number'),
                  ),
                ),
                Container(
                  child: RoundedButton(
                    text: 'Generate OTP',
                    press: () {
                      printDetails();
                    },
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
