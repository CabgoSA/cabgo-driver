import 'package:cabgo_driver/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../states/app_state.dart';
import 'package:provider/provider.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();

    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xff090F13FF),
        body: ColorfulSafeArea(
          color: Colors.white,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 55.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            fontFamily: 'Red Hat Display',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 4.1 / 5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(30.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 120.0, left: 10.0, right: 10.0),
                              child: TextField(
                                controller: appState.phoneController,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Phone Number",
                                  prefixIcon: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10.0))),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.2, color: Color(0xff000000)),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.2, color: Color(0xff090F13)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 15.0, top: 25.0),
                                  filled: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 10.0, right: 10.0),
                              child: TextField(
                                controller: appState.passwordController,
                                obscureText: !passwordVisibility,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Enter Your  Password",
                                  prefixIcon: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10.0))),
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0.2, color: Color(0xff090F13)),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.2, color: Color(0xff090F13)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 15.0, top: 25.0),
                                  filled: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPasswordWidget(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          fontFamily: 'Red Hat Display',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: TextButton(
                                  onPressed: () async {
                                    try {
                                      if (formKey.currentState.validate()) {
                                        isLoading = true;
                                        bool result =
                                            await InternetConnectionChecker()
                                                .hasConnection;
                                        if (result) {
                                          await appState.login();
                                          if (appState.isLoggedIn) {
                                            Navigator.popUntil(
                                                context,
                                                await Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DashboardPageWidget(),
                                                  ),
                                                ));
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            appState.SnackBarCaller(
                                                "No Internet Connection"),
                                          );
                                        }

                                        isLoading = false;
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        appState.SnackBarCaller(
                                            "Incorect Login Details"),
                                      );
                                    }
                                  },
                                  child: isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Red Hat Display'),
                                        ),
                                  //
                                  // style: ButtonStyle(
                                  //     backgroundColor: MaterialStateProperty.all(),
                                  //
                                  //     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14))),

                                  style: ElevatedButton.styleFrom(
                                      primary: FlutterFlowTheme.of(context)
                                          .primaryColor),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don’t have an account? '),
                                GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterPageWidget(),
                                      ),
                                    );
                                  },
                                  child: Text('Sign up here',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
