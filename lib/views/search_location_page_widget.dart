import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchLocationPageWidget extends StatefulWidget {
  const SearchLocationPageWidget({Key key}) : super(key: key);

  @override
  _SearchLocationPageWidgetState createState() =>
      _SearchLocationPageWidgetState();
}

class _SearchLocationPageWidgetState extends State<SearchLocationPageWidget> {
  LatLng googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  TextEditingController fromController;
  TextEditingController whereToController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fromController = TextEditingController();
    whereToController = TextEditingController(text: 'Where to?');
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
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [
          FFButtonWidget(
            onPressed: () async {
              context.pushNamed('SchedulePage');
            },
            text: 'DONE',
            options: FFButtonOptions(
              width: 130,
              height: 40,
              color: FlutterFlowTheme.of(context).primaryColor,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Red Hat Display',
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
        ],
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FlutterFlowGoogleMap(
                            controller: googleMapsController,
                            onCameraIdle: (latLng) => googleMapsCenter = latLng,
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
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          child: TextFormField(
                            controller: fromController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'fromController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
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
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              suffixIcon: fromController.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => fromController?.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 55, 5, 0),
                          child: TextFormField(
                            controller: whereToController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'whereToController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Where to?',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 0.4,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 0.4,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: whereToController.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () => setState(
                                        () => whereToController?.clear(),
                                      ),
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Red Hat Display',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
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
        ),
      ),
    );
  }
}
