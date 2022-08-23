import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class SchedulePageWidget extends StatefulWidget {
  const SchedulePageWidget({Key key}) : super(key: key);

  @override
  _SchedulePageWidgetState createState() => _SchedulePageWidgetState();
}

class _SchedulePageWidgetState extends State<SchedulePageWidget> {
  LatLng googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  TextEditingController fromController1;
  TextEditingController fromController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fromController1 = TextEditingController();
    fromController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
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
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.my_location_sharp,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
        ],
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: FlutterFlowGoogleMap(
                                controller: googleMapsController,
                                onCameraIdle: (latLng) =>
                                    googleMapsCenter = latLng,
                                initialLocation: googleMapsCenter ??=
                                    LatLng(13.106061, -59.613158),
                                markerColor: GoogleMarkerColor.violet,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 14,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: true,
                                showLocation: true,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                              child: TextFormField(
                                controller: fromController1,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'fromController1',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Enter Location',
                                  hintText: 'Enter Location',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 0.4,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 0.4,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  suffixIcon: fromController1.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () => setState(
                                            () => fromController1?.clear(),
                                          ),
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Red Hat Display',
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 50, 5, 0),
                              child: TextFormField(
                                controller: fromController2,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'fromController2',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Enter Location',
                                  hintText: 'Enter Location',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 0.4,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 0.4,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  suffixIcon: fromController2.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () => setState(
                                            () => fromController2?.clear(),
                                          ),
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Red Hat Display',
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.1, 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.black,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'R139.00',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(120),
                                                child: Image.asset(
                                                  'assets/images/Black.png',
                                                  width: 80,
                                                  height: 60,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Text(
                                                '24.9 kms',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'CabgoLite ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'R139.00',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(120),
                                                child: Image.asset(
                                                  'assets/images/Lite.png',
                                                  width: 80,
                                                  height: 60,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Text(
                                                '24.9 kms',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'CabgoLite ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'R139.00',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(120),
                                                child: Image.asset(
                                                  'assets/images/Van.png',
                                                  width: 80,
                                                  height: 60,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Text(
                                                '24.9 kms',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'CabgoLite ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'R139.00',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(120),
                                                child: Image.asset(
                                                  'assets/images/Xl.png',
                                                  width: 80,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                '24.9 kms',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'CabgoLite ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFF5F5F5),
                                    elevation: 1,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'R139.00',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(120),
                                                child: Image.asset(
                                                  'assets/images/Xpress.png',
                                                  width: 80,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                '24.9 kms',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Red Hat Display',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                              Text(
                                                'CabgoLite ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 50, 5, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'PROCEED',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Red Hat Display',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 2,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
