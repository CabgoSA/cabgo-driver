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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        if(formKey.currentState.validate()){
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
          print('error');
        } on RegisterError {
          print('error');
        } catch(e){

        }
       }

      },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 24,
        ),
      ),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
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
                          TextFormField(
                            controller: appState.registerEmailController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'emailController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'name@xample.com',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w300,
                                    ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value != null && value.length <7 || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ){
                                return "Enter valid email";
                              }else{
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: appState.registerFirstNameController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'firstNameController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Name ',
                              hintText: 'First name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 0.5,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 0.5,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w300,
                                    ),

                            validator: (value){
                              if(value != null && value.length <3 ){
                                return "Name too short";
                              }else{
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: appState.registerLastNameController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'lastNameController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              hintText: 'Last name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w300,
                                    ),
                            validator: (value){
                              if(value != null && value.length <2 ){
                                return "Last Name too short";
                              }else{
                                return null;
                              }
                            },
                          ),




                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                    child: Text(
                                      '+27',
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child:
                                TextFormField(
                                  controller: appState.registerPhoneController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'phoneController',
                                    Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Phone',
                                    hintText: 'Phone Number',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).primaryText,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme.of(context).primaryText,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  keyboardType: TextInputType.number,


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
                            ],
                          ),


                          TextFormField(
                            controller: appState.registerPasswordController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'passwordController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: '*********',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w300,
                                    ),
                            keyboardType: TextInputType.visiblePassword,

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
                          TextFormField(
                            controller: appState.registerConfirmPasswordController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'confirmPasswordController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: !confirmPasswordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: '*********',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      fontWeight: FontWeight.w300,
                                    ),
                            keyboardType: TextInputType.visiblePassword,

                            validator: (value){
                              if(value != password ){
                                return "Password does not match";
                              }
                              else{
                                return null;
                              }
                            },
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
