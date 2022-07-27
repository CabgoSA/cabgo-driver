import 'package:cabgo_driver/index.dart';

import '../exceptions/locationErrors.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool confirmPasswordVisibility;
  bool passwordVisibility;
  String password = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 14, 0, 0),
                      child: Text(
                        'Enter your details to register',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 16,
                            ),
                      ),
                    ),
                    Form(
                      key: formKey,

                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, left: 10.0, right: 10.0),
                            child: TextFormField(
                              controller: appState.registerEmailController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'emailController',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              obscureText: false,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: 'name@xample.com',

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
                              validator: (value){
                                if(value != null && value.length <7 || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ){
                                  return "Enter valid email";
                                }else{
                                  return null;
                                }
                              },
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            child: TextFormField(
                              controller: appState.registerFirstNameController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'firstNameController',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              obscureText: false,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'First name',

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
                                validator: (value){
                                  if(value != null && value.length <3 ){
                                    return "Name too short";
                                  }else{
                                    return null;
                                  }
                                },

                            ),

                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            child: TextFormField(
                              controller: appState.registerLastNameController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'lastNameController',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              obscureText: false,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                hintText: 'Last name',

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
                                validator: (value){
                                  if(value != null && value.length <2 ){
                                    return "Last Name too short";
                                  }else{
                                    return null;
                                  }
                                },

                            ),

                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            child: TextFormField(
                              controller: appState.registerPhoneController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'phoneController',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              obscureText: false,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: 'Phone',
                                hintText: 'Phone Number',
                                prefixIcon: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10.0))),
                                  child: Row(
                                    children: [
                                      Text("+27", style: TextStyle(
                                        color: Colors.white
                                      ),),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ],
                                  )
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
                              validator: (value){
                                if(value == null || value =="" || value.length <1 ){
                                  return "This Field can't be empty";
                                }else if(value.length <9  ){
                                  return "Too short - phone should be 9 digits e.g (786942318)";
                                }else if(value.length >9  ){
                                  return "Too long - phone should be 9 digits e.g (786942318)";
                                }else if(value.length <9  ){
                                  return "phone should be 9 digits e.g (786942318)";
                                }else if(value[0]  =="0" ){
                                  return "Number should not start with a 0 e.g (786942318)";
                                }
                                else{
                                  return null;
                                }
                              },

                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10.0, right: 10.0),
                            child: TextFormField(
                              controller: appState.registerPasswordController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'passwordController',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: false,
                              obscureText: !passwordVisibility,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: '*********',

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

                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                        () =>
                                    passwordVisibility = !passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                    size: 22,
                                  ),
                                ),
                              ),

                              validator: (value){
                                if(value == null || value =="" || value.length <1 ){
                                  return "This Field can't be empty";
                                }
                                else{
                                  password =value;
                                  return null;
                                }
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10.0, right: 10.0),
                            child:  TextFormField(
                              controller: appState.registerConfirmPasswordController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'confirmPasswordController',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: false,
                              obscureText: !confirmPasswordVisibility,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                hintText: '*********',

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

                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                        () => confirmPasswordVisibility =
                                    !confirmPasswordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    confirmPasswordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                    size: 22,
                                  ),
                                ),
                              ),

                                validator: (value){
                                  if(value != password ){
                                    return "Password does not match";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child:  TextButton(
                                onPressed: () async {
                                  if(formKey.currentState.validate()){
                                    isLoading = true;
                                    try {
                                      await appState.register();
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VerifyPageWidget(),
                                        ),
                                      );

                                    }on UserNotRegistered {
                                      isLoading = false;
                                      print('error');
                                    } on RegisterError {
                                      isLoading = false;
                                      print('error');
                                    } catch(e){
                                      isLoading = false;
                                    }
                                  }

                                },
                                child: isLoading ?   CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : Text( 'Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Red Hat Display'
                                  ),

                                ),


                                style: ElevatedButton.styleFrom(
                                    primary: FlutterFlowTheme.of(context).primaryColor),


                              ),
                            ),
                          ),








                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('TermsPage');
                                },
                                child: Text(
                                  'READ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Red Hat Display',
                                        color: Color(0xFFCB1616),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: appState.registerTermsAndConditionsValue ??= true,
                                    onChanged: (newValue) => setState(() =>
                                    appState.registerTermsAndConditionsValue = newValue),
                                    title: Text(
                                      'I have read and agreed to the terms and conditions',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Red Hat Display',
                                            color: Color(0xFF3A26E9),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
