import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'verify_otp_widget.dart';
import './login_page_widget.dart';
import './register_page_widget.dart';

import '../states/app_state.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({Key key}) : super(key: key);

  @override
  _ResetPasswordWidgetState createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  bool isLoading = false;

  // This function will be triggered when the button is pressed

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Reset Password',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Red Hat Display',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Enter your cellphone number you used for regitering',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff0F0F0F),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: TextField(
                      maxLength: 9,
                      controller: appState.resetPhoneNumber,
                      keyboardType: TextInputType.phone,
                      onChanged: (_) => EasyDebounce.debounce(
                        'textController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: Color(0xff090F13),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 4.0, right: 4.0),
                              child: Row(
                                children: [
                                  Text(
                                    '+27',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        hintText: "Enter Phone Number",
                        fillColor: Color(0xffE0E0E0),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff090F13)),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff090F13)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0, top: 25.0),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 50, top: 6.0, bottom: 6.0),
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Send Reset Code',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "Red Hat Display",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff090F13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                      ),
                      onPressed: () async {
                        setState(() => isLoading = true);
                        try {
                          bool result =
                              await InternetConnectionChecker().hasConnection;
                          if (result) {
                            await appState.requestResetOtp();
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyOtpPageWidget(),
                              ),
                            );
                          } else {
                            isLoading = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                              appState.SnackBarCaller("No Internet Connection"),
                            );
                          }
                        } catch (e) {
                          isLoading = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            appState.SnackBarCaller(
                                "There was a problem reseting password"),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text('Go back to '),
                              GestureDetector(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPageWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'sign in',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text('I am a new user  '),
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
                                child: Text(
                                  'sign up',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
