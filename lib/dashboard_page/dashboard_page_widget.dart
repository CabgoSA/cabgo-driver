import '../components/side_nav_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPageWidget extends StatefulWidget {
  const DashboardPageWidget({Key key}) : super(key: key);

  @override
  _DashboardPageWidgetState createState() => _DashboardPageWidgetState();
}

class _DashboardPageWidgetState extends State<DashboardPageWidget> {
  LatLng googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          elevation: 16,
          child: SideNavWidget(),
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
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: FlutterFlowGoogleMap(
                    controller: googleMapsController,
                    onCameraIdle: (latLng) =>
                        setState(() => googleMapsCenter = latLng),
                    initialLocation: googleMapsCenter ??=
                        LatLng(13.106061, -59.613158),
                    markerColor: GoogleMarkerColor.green,
                    mapType: MapType.normal,
                    style: GoogleMapStyle.standard,
                    initialZoom: 18,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: false,
                    showLocation: true,
                    showCompass: true,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, -1),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.menu_sharp,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              scaffoldKey.currentState.openDrawer();
                            },
                          ),
                        ),
                        FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyDuQbYTtgD64DsfsEnGhFc4-Vjfi4_7mfQ',
                          androidGoogleMapsApiKey:
                              'AIzaSyDuQbYTtgD64DsfsEnGhFc4-Vjfi4_7mfQ',
                          webGoogleMapsApiKey: '',
                          onSelect: (place) =>
                              setState(() => placePickerValue = place),
                          defaultText: '',
                          icon: Icon(
                            Icons.my_location,
                            color: FlutterFlowTheme.of(context).black600,
                            size: 30,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 50,
                            height: 50,
                            color: Color(0x004B39EF),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Red Hat Display',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 50,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('SearchLocationPage');
                                  },
                                  text: 'Diepsloot Extension, 13 , fourways',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Red Hat Display',
                                          color: FlutterFlowTheme.of(context)
                                              .gray600,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    elevation: 1,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    borderRadius: 0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 50, 5, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('SearchLocationPage');
                                  },
                                  text: 'Where to ?',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Red Hat Display',
                                          color: FlutterFlowTheme.of(context)
                                              .gray600,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    elevation: 1,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    borderRadius: 0,
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.01,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
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
