import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xaiur_app/widgets/custom_elevated.dart';

import 'package:xaiur_app/widgets/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController _controller = PageController();
  bool _isTap1 = true;
  bool _isTap2 = false;

  DateTime selectedDate = DateTime.now();
  bool isDatePicked = false;
  bool isHide = false;
  String? valueChoose;
  List listItem = ["Laki-laki", "Perempuan", "Lainnya"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: _buildLogo(),
                ),
                Divider(
                  height: 10,
                ),
                _buildUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildLogo() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/x1.PNG"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Image.asset(
                  "assets/x2.PNG",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "aiur",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      );

  _buildUI() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _controller.previousPage(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.elasticOut);

                  setState(() {
                    _isTap1 = true;
                    if (_isTap1) {
                      _isTap2 = false;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            color:
                                _isTap1 ? Color(0xFFE31E24) : Color(0xFF707070),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                      ),
                      _isTap1
                          ? Container(
                              height: 3,
                              width: (Get.width - 100) / 2,
                              color: Colors.red,
                            )
                          : Container(
                              width: (Get.width - 100) / 2,
                            )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.elasticOut);

                  setState(() {
                    if (_isTap2 == false) {
                      _isTap2 = true;
                      _isTap1 = false;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            color:
                                _isTap2 ? Color(0xFFE31E24) : Color(0xFF707070),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        height: 10,
                      ),
                      _isTap2
                          ? Container(
                              height: 3,
                              width: (Get.width - 100) / 2,
                              color: Colors.red,
                            )
                          : Container(
                              width: (Get.width - 100) / 2,
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 10,
          ),
          Container(
            height: Get.height * 0.5,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              scrollBehavior: ScrollBehavior(),
              controller: _controller,
              children: [
                _signUp(),
                _signIn(),
              ],
            ),
          ),
        ],
      );

  _signIn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            ..._emailAndPassword(),
            SizedBox(height: 30.0),
            CustomElevatedButton(
              text: 'Masuk',
              color: Color(0xFFE31E24),
              size: Size(110, 54.0),
              onPressed: () {},
            ),
            TextButton(
              onPressed: () {},
              child: Text("Lupa password?"),
              style: TextButton.styleFrom(primary: Color(0xFF707070)),
            )
          ],
        ),
      );

  _signUp() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                inputAction: TextInputAction.next,
                hint: 'Nama',
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                onChanged: (val) {},
              ),
              SizedBox(height: 15.0),
              CustomTextField(
                inputAction: TextInputAction.next,
                hint: 'Username',
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                onChanged: (val) {},
              ),
              SizedBox(height: 15.0),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color(0xFF707070).withOpacity(0.5),
                    ),
                  ),
                ),
                height: 50,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: isDatePicked
                          ? Text(
                              new DateFormat("dd MMMM yyyy")
                                  .format(selectedDate),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              "Tanggal lahir",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF707070),
                              ),
                            ),
                    ),
                    InkWell(
                      onTap: () async {
                        DateTime? picked = await showRoundedDatePicker(
                          context: context,
                          height: Get.height / 2.7,
                          theme: ThemeData(
                            primaryColor: Color(0xFFE31E24),
                            accentColor: Color(0xFFE31E24),
                            textTheme: TextTheme(
                              bodyText2: TextStyle(
                                color: Colors.black,
                              ),
                              caption: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          styleDatePicker: MaterialRoundedDatePickerStyle(
                            textStyleCurrentDayOnCalendar: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textStyleDayOnCalendar: TextStyle(
                              fontSize: 16,
                            ),
                            textStyleDayOnCalendarSelected: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textStyleDayOnCalendarDisabled:
                                TextStyle(fontSize: 16),
                            textStyleMonthYearHeader: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            paddingDatePicker: EdgeInsets.all(0),
                            paddingMonthHeader: EdgeInsets.all(10),
                            paddingActionBar: EdgeInsets.zero,
                            paddingDateYearHeader: EdgeInsets.all(10),
                            sizeArrow: 20,
                            colorArrowNext: Color(0xFF707070),
                            colorArrowPrevious: Color(0xFF707070),
                          ),
                          initialDate: selectedDate, // Refer step 1
                          firstDate: DateTime(1500),
                          lastDate: DateTime(3000),
                        );
                        setState(() {
                          if (picked != null && picked != selectedDate) {
                            selectedDate = picked;
                            isDatePicked = true;
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: isDatePicked
                            ? [Icon(Icons.expand_more)]
                            : [
                                Text(
                                  new DateFormat("dd-MM-yyyy")
                                      .format(selectedDate),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.expand_more)
                              ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              CustomTextField(
                inputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                hint: 'No. Handphone',
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                onChanged: (val) {},
              ),
              SizedBox(height: 15.0),
              Container(
                height: 50,
                width: Get.width,
                child: DropdownButton(
                  isExpanded: true,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF707070),
                        ),
                      ),
                    ),
                  ),
                  icon: Icon(Icons.expand_more),
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Jenis kelamin",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(valueItem),
                      ),
                      value: valueItem,
                    );
                  }).toList(),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue as String?;
                    });
                  },
                ),
              ),
              SizedBox(height: 15.0),
              ..._emailAndPassword(),
              SizedBox(height: 30.0),
              CustomElevatedButton(
                color: Color(0xFFE31E24),
                text: 'Daftar',
                size: Size(110, 54.0),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );

  List<Widget> _emailAndPassword() => [
        CustomTextField(
          keyboardType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
          hint: 'Email',
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          onChanged: (val) {},
        ),
        SizedBox(height: 15.0),
        CustomTextField(
          suffix: InkWell(
            onTap: () {
              setState(() {
                if (isHide == false) {
                  isHide = true;
                } else if (isHide == true) {
                  isHide = false;
                }
              });
            },
            child: Icon(
              isHide ? Icons.visibility_off : Icons.visibility,
              size: 20,
            ),
          ),
          inputAction: TextInputAction.done,
          hint: 'Password',
          fontSize: 18.0,
          obscureText: isHide ? false : true,
          fontWeight: FontWeight.normal,
          onChanged: (val) {},
        )
      ];
}
