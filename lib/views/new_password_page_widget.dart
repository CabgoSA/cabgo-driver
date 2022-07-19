import 'package:cabgo_driver/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../states/app_state.dart';
import 'package:provider/provider.dart';

class NewPasswordPageWidget extends StatefulWidget {
  const NewPasswordPageWidget({Key key}) : super(key: key);

  @override
  _NewPasswordPageWidgetState createState() => _NewPasswordPageWidgetState();
}

class _NewPasswordPageWidgetState extends State<NewPasswordPageWidget> {

  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

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
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Align(
          alignment: AlignmentDirectional(0, 1),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Image.asset(
                            'assets/images/BLACK_CABGO_LOGO.png',
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                        )
                        ,
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Reset Password,',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: appState.newPassword,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'New Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintText: 'Enter your new password here...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        16, 24, 0, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                            () => passwordVisibility =
                                        !passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF95A1AC),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (value){
                                    if(value != null && value.length <4 ){
                                      return "Enter valid pasword";
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: appState.newPasswordConfirm,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Confirm New Password',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintText: 'confirm your password here...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        16, 24, 0, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                            () => passwordVisibility =
                                        !passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF95A1AC),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF2B343A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  validator: (value){
                                    if(value != null && value.length <4 ){
                                      return "Enter valid pasword";
                                    }else{
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () async {

                                    await appState.passwordReset();

                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginPageWidget(),
                                        ),
                                      );

                                },
                                child: isLoading ?   CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : Text( 'Reset'),

                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(130, 40),
                                    primary: FlutterFlowTheme.of(context).primaryColor),

                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                          color: FlutterFlowTheme.of(context).lineColor,
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
    );
  }
}
