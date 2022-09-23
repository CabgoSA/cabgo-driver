import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class TermsPageWidget extends StatefulWidget {
  const TermsPageWidget({Key key}) : super(key: key);

  @override
  _TermsPageWidgetState createState() => _TermsPageWidgetState();
}

class _TermsPageWidgetState extends State<TermsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.87,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).textColor,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        'Terms and Conditions',
                                        style:
                                            FlutterFlowTheme.of(context).title2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "CABGO TERMS AND CONDITIONS FOR DRIVERS",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: Text(
                                        "Last Updated 26 August 2022 \nThese Terms and Conditions of Service constitute a legally binding agreement (the \“Agreement\”) between you and Cabgo, Inc., its parents, subsidiaries, representatives, affiliates, officers and directors (collectively, \“Cabgo,\” \“we,\” \“us\” or \“our\”) governing your use of the Cabgo application, website, and technology platform (collectively, the \“Cabgo Platform\”).\nBy entering into this Agreement, and/or by using or accessing the Cabgo Platform you expressly acknowledge that you understand this Agreement (including the dispute resolution and arbitration provisions) and accept all of its terms. IF YOU DO NOT AGREE TO BE BOUND BY THE TERMS AND CONDITIONS OF THIS AGREEMENT, YOU MAY NOT USE OR ACCESS THE CABGO PLATFORM OR ANY OF THE SERVICES PROVIDED THROUGH THE CABGO PLATFORM. If you use the Cabgo Platform in another country, you agree to be subject to Cabgo's terms of service for that country.",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 4),
                                        child: Text(
                                          "The Cabgo Platform \nThe Cabgo Platform provides a marketplace where persons who seek transportation to certain destinations (\“Riders\”) can be matched with transportation options to such destinations\. One option for Riders is to request a ride from rideshare drivers who are driving to or through those destinations (\“Drivers\”). Drivers and Riders are collectively referred to herein as “Users,” and the driving services provided by Drivers to Riders shall be referred to herein as \"Rideshare Services.\" As a User, you authorize CabGo to match you with a Driver or Rider based on factors such as your location, the estimated time to pick-up, your destination, user preferences, and platform efficiency, and to cancel an existing match and rematch based on the same considerations. Any decision by a User to offer or accept Rideshare Services is a decision made in such User\’s sole discretion. Each Rideshare Service provided by a Driver to a Rider shall constitute a separate agreement between such persons.",
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 4),
                                        child: Text(
                                          "1. Eligibility \n\n\The Cabgo Platform may only be used by individuals who have the right and authority to enter into this Agreement, are fully able and competent to satisfy the terms, conditions, and obligations herein. The Cabgo Platform is not available to Users who have had their User account temporarily or permanently deactivated. You may not allow other persons to use your User account, and you agree that you are the sole authorized user of your account. To use the Cabgo Platform, each User shall create a User account. Each person may only create one User account, and Cabgo reserves the right to deactivate any additional or duplicate accounts.",
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 4),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 4),
                                        child: Text(
                                          "1. Eligibility \n\n\The Cabgo Platform may only be used by individuals who have the right and authority to enter into this Agreement, are fully able and competent to satisfy the terms, conditions, and obligations herein. The Cabgo Platform is not available to Users who have had their User account temporarily or permanently deactivated. You may not allow other persons to use your User account, and you agree that you are the sole authorized user of your account. To use the Cabgo Platform, each User shall create a User account. Each person may only create one User account, and Cabgo reserves the right to deactivate any additional or duplicate accounts.",
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
