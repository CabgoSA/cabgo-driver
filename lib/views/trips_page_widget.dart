import 'package:provider/provider.dart';

import '../states/app_state.dart';
import 'components/side_nav_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class TripsPageWidget extends StatefulWidget {
  const TripsPageWidget({Key key}) : super(key: key);

  @override
  _TripsPageWidgetState createState() => _TripsPageWidgetState();
}

class _TripsPageWidgetState extends State<TripsPageWidget> {
  LatLng googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  LatLng googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          'My Trips',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Red Hat Display',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: SideNavWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.of(context).textColor,
                          labelStyle: FlutterFlowTheme.of(context).bodyText1,
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          tabs: [
                            Tab(
                              text: 'PAST',
                            ),
                            Tab(
                              text: 'UPCOMING',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                  for (var i = 0; i < appState.pastTrips.length; i++)
                                     Padding(
                                       padding: EdgeInsetsDirectional.fromSTEB(
                                           5, 5, 5, 5),
                                       child: Card(
                                         clipBehavior:
                                         Clip.antiAliasWithSaveLayer,
                                         color: Color(0xFFF5F5F5),
                                         child: Container(
                                           height: 200,
                                           decoration: BoxDecoration(),
                                           child: Padding(
                                             padding:
                                             EdgeInsetsDirectional.fromSTEB(
                                                 5, 5, 5, 5),
                                             child: Column(
                                               mainAxisSize: MainAxisSize.max,
                                               children: [
                                                 SizedBox(
                                                   height: 120,
                                                   width: double.infinity,
                                                   child:
                                                   Expanded(
                                                     child: Image.network(
                                                       appState
                                                           .pastTrips[i]['static_map'],
                                                       width: 36,
                                                       height: 36,
                                                       fit: BoxFit.cover,
                                                     ),
                                                   ),

                                                 ),
                                                 Row(
                                                   mainAxisSize:
                                                   MainAxisSize.max,
                                                   mainAxisAlignment:
                                                   MainAxisAlignment
                                                       .spaceAround,
                                                   children: [
                                                     Image.network(
                                                       appState
                                                           .pastTrips[i]['service_type']['image'],
                                                       width: 50,
                                                       height: 50,
                                                       fit: BoxFit.contain,
                                                     ),
                                                     Column(
                                                       mainAxisSize:
                                                       MainAxisSize.max,
                                                       crossAxisAlignment:
                                                       CrossAxisAlignment
                                                           .start,
                                                       children: [
                                                         Padding(
                                                           padding:
                                                           EdgeInsetsDirectional
                                                               .fromSTEB(5,
                                                               0, 0, 0),
                                                           child: Text(
                                                             appState
                                                                 .pastTrips[i]['assigned_at'],
                                                             style: FlutterFlowTheme
                                                                 .of(context)
                                                                 .bodyText1,
                                                           ),
                                                         ),
                                                         Text(
                                                           appState
                                                               .pastTrips[i]['booking_id'],
                                                           textAlign:
                                                           TextAlign.start,
                                                           style: FlutterFlowTheme
                                                               .of(context)
                                                               .bodyText1
                                                               .override(
                                                             fontFamily:
                                                             'Red Hat Display',
                                                             fontSize: 12,
                                                             fontWeight:
                                                             FontWeight
                                                                 .w300,
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                     Align(
                                                       alignment:
                                                       AlignmentDirectional(
                                                           1, 0),
                                                       child: Padding(
                                                         padding:
                                                         EdgeInsetsDirectional
                                                             .fromSTEB(10, 0,
                                                             0, 0),
                                                         child: Column(
                                                           mainAxisSize:
                                                           MainAxisSize.max,
                                                           mainAxisAlignment:
                                                           MainAxisAlignment
                                                               .spaceBetween,
                                                           crossAxisAlignment:
                                                           CrossAxisAlignment
                                                               .start,
                                                           children: [
                                                             Text(
                                                             (double.parse(appState
                                                             .pastTrips[i]['distance']) * double.parse(appState.pastTrips[i]['service_type']['price'])).toString(),
                                                               style: FlutterFlowTheme
                                                                   .of(context)
                                                                   .bodyText1,
                                                             ),
                                                             Text(
                                                               appState
                                                                   .pastTrips[i]['service_type']['name']
                                                                   .toString(),
                                                               textAlign:
                                                               TextAlign.end,
                                                               style: FlutterFlowTheme
                                                                   .of(context)
                                                                   .bodyText1
                                                                   .override(
                                                                 fontFamily:
                                                                 'Red Hat Display',
                                                                 fontSize:
                                                                 12,
                                                                 fontWeight:
                                                                 FontWeight
                                                                     .w300,
                                                               ),
                                                             ),
                                                           ],
                                                         ),
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    for (var i = 0; i < appState.pastTrips.length; i++)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                        child: Card(
                                          clipBehavior:
                                          Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFF5F5F5),
                                          child: Container(
                                            height: 200,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SizedBox(
                                                    height: 120,
                                                    width: double.infinity,
                                                    child:
                                                    Expanded(
                                                      child: Image.network(
                                                        appState
                                                            .pastTrips[i]['static_map'],
                                                        width: 36,
                                                        height: 36,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),

                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      Image.network(
                                                        appState
                                                            .pastTrips[i]['service_type']['image'],
                                                        width: 50,
                                                        height: 50,
                                                        fit: BoxFit.contain,
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(5,
                                                                0, 0, 0),
                                                            child: Text(
                                                              appState
                                                                  .pastTrips[i]['assigned_at'],
                                                              style: FlutterFlowTheme
                                                                  .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                          Text(
                                                            appState
                                                                .pastTrips[i]['booking_id'],
                                                            textAlign:
                                                            TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                .of(context)
                                                                .bodyText1
                                                                .override(
                                                              fontFamily:
                                                              'Red Hat Display',
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                        AlignmentDirectional(
                                                            1, 0),
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(10, 0,
                                                              0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text(
                                                                appState
                                                                    .pastTrips[i]['distance']
                                                                    .toString(),
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyText1,
                                                              ),
                                                              Text(
                                                                appState
                                                                    .pastTrips[i]['service_type']['name']
                                                                    .toString(),
                                                                textAlign:
                                                                TextAlign.end,
                                                                style: FlutterFlowTheme
                                                                    .of(context)
                                                                    .bodyText1
                                                                    .override(
                                                                  fontFamily:
                                                                  'Red Hat Display',
                                                                  fontSize:
                                                                  12,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
