import 'package:cabgo_driver/index.dart';
import 'package:provider/provider.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../states/app_state.dart';
import 'dart:io' show Platform;


class SideNavWidget extends StatefulWidget {
  const SideNavWidget({Key key}) : super(key: key);

  @override
  _SideNavWidgetState createState() => _SideNavWidgetState();
}

class _SideNavWidgetState extends State<SideNavWidget> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).gray200,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                    )
                  ],
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: appState.driver.picture!=null?
                          Image.network(
                          'http://cabgo.co.za/uploads/772a0d10d50275d90eb66a74dae0db194ee4ea65.jpg',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ):  Image.asset(
                          'assets/images/profile.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        )

                ,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                appState.driver.fullName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    appState.driver.phone,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await appState.historyTrips();
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TripsPageWidget(),
                            ),
                          );
                        }catch(e){
                          print(e);
                        }
                      },
                      child: Text(
                        'My Trips',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await appState.summary();
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EarningsPageWidget(),
                            ),
                          );
                        }catch(e){
                          print(e);
                        }
                      },
                      child: Text(
                        'Earnings',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {
                      await Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      WalletPageWidget(),
                      ),
                      );

                      },
                      child: Text(
                        'Wallet',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SettingsWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'Settings',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HelpPageWidget(),
                          ),
                        );
                      },
                      child: Text(
                        'Help',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {


                        if (Platform.isAndroid) {
                          // Android-specific code
                          await Share.share('https://play.google.com/store/apps/details?id=com.cabgo.udriver&hl=en_ZA&gl=US');
                        } else if (Platform.isIOS) {
                          // iOS-specific code
                          await Share.share('');
                        }

                      },
                      child: Text(
                        'Share',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await appState.logout();
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPageWidget(),
                              ),
                            );

                        }catch(e){
                          print(e);
                        }
                      },
                      child: Text(
                        'Logout',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Red Hat Display',
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
