import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialsPageWidget extends StatefulWidget {
  const SocialsPageWidget({Key key}) : super(key: key);

  @override
  _SocialsPageWidgetState createState() => _SocialsPageWidgetState();
}

class _SocialsPageWidgetState extends State<SocialsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                          child: Text(
                            'Choose an account',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/unnamed.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'FaceBook',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/download_(1).png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Google',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
