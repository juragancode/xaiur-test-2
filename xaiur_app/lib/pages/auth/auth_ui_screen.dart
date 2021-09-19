import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              CustomTextField(
                inputAction: TextInputAction.next,
                hint: 'No. Handphone',
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
                onChanged: (val) {},
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

  bool isHide = false;

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
              isHide ? Icons.visibility : Icons.visibility_off,
              size: 20,
            ),
          ),
          inputAction: TextInputAction.done,
          hint: 'Password',
          fontSize: 18.0,
          obscureText: isHide ? true : false,
          fontWeight: FontWeight.normal,
          onChanged: (val) {},
        )
      ];
}
