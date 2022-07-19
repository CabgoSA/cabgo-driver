import 'package:cabgo_driver/views/new_password_page_widget.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../states/app_state.dart';

class VerifyOtpPageWidget extends StatefulWidget {
  const VerifyOtpPageWidget({Key key}) : super(key: key);

  @override
  _VerifyOtpPageWidgetState createState() => _VerifyOtpPageWidgetState();
}

class _VerifyOtpPageWidgetState extends State<VerifyOtpPageWidget> {
  TextEditingController field1Controller;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();



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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                      child: Text(
                        'OTP sent to your number',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: TextFormField(
                              maxLength: 1,
                              controller: appState.textController1,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController1',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: TextFormField(
                              maxLength: 1,
                              controller: appState.textController2,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController2',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: TextFormField(
                              maxLength: 1,
                              controller: appState.textController3,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController3',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: TextFormField(
                              maxLength: 1,
                              controller: appState.textController4,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController4',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: TextFormField(
                              maxLength: 1,
                              controller: appState.textController5,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController5',
                                Duration(milliseconds: 2000),
                                    () => setState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Reend OTP',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          FFButtonWidget(
                            onPressed: () async{
                             await appState.verifyOtp();
                             await Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) =>
                                     NewPasswordPageWidget(),
                               ),
                             );

                            },
                            text: 'Verify',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                fontFamily: 'Red Hat Display',
                                color: Colors.white,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
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
