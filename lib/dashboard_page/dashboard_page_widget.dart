
import 'package:cabgo_driver/services/local_notification_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:uuid/uuid.dart';
import '../components/side_nav_widget.dart';
 import '../flutter_flow/flutter_flow_icon_button.dart';
 import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
 import 'package:google_maps_flutter/google_maps_flutter.dart';
 import 'package:provider/provider.dart';
 import 'package:cabgo_driver/states/app_state.dart';
 import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../flutter_flow/place.dart';

class DashboardPageWidget extends StatefulWidget {
  const DashboardPageWidget({Key key}) : super(key: key);

  @override
  _DashboardPageWidgetState createState() => _DashboardPageWidgetState();
}

class _DashboardPageWidgetState extends State<DashboardPageWidget> {



  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    if(appState.notifications != null ) {
      FlutterRingtonePlayer.play(fromAsset: "assets/audios/request.mp3");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        show(context,appState, appState.notifications);
      });
      Future.delayed(Duration(milliseconds: 1500), () {
        FlutterRingtonePlayer.stop();
        appState.notifications = null;
      });
    }
    return  Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          if(appState.isOnline){
            await appState.goOnline('offline');
          }else{
            await appState.goOnline('active');
          }
        },
        label:   appState.isOnline ? const Text('Go Offline') : const Text('Go Online '),
        icon: const Icon(Icons.thumb_up),
        backgroundColor: Colors.green,
      ),
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
                  child: Map(),
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


  void show(BuildContext context, AppState appState, PushNotifications notifications) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                 Text(notifications.body.toString()),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(

                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFC40000),
                          textStyle: const TextStyle(fontSize: 20,
                            fontFamily: 'Red Hat Display',
                            color: Colors.white,
                            fontWeight: FontWeight.w300,),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Decline'),
                      ),

                      TextButton(

                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFC40000),
                          textStyle: const TextStyle(fontSize: 20,
                            fontFamily: 'Red Hat Display',
                            color: Colors.white,
                            fontWeight: FontWeight.w300,),
                        ),
                        onPressed: () async{
                          print(notifications.requestID);
                           await appState.acceptRequest( int.parse(notifications.requestID));
                            if(appState.info != null){
                             appState.driveToPick(appState.initialPosition, appState.info.riderLocation);
                             // Navigator.pop(context);
                           }else{
                              print('ooops');
                           }
                        },
                        child: const Text('Accept'),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}

class Map extends StatefulWidget {
  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {

  var uuid = Uuid();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return appState.initialPosition == null
        ? Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.black54 : Colors.green,
                      ),
                    );
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: appState.locationServiceActive == false,
              child: Text(
              "Please enable location services!",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),

            ),

          ],
        ))
        : Stack(
      children: <Widget>[
        (appState.info == null) ?
        GoogleMap(
          initialCameraPosition:
          CameraPosition(target: appState.initialPosition, zoom: 18),
          onMapCreated: appState.onCreated,
          myLocationEnabled: true,
          mapType: MapType.normal,
          onCameraMove: appState.onCameraMove,
          compassEnabled: true,

        ) :
        GoogleMap(
          initialCameraPosition:
          CameraPosition(target: appState.initialPosition, zoom: 18),
          onMapCreated: appState.onCreated,
          myLocationEnabled: true,
          mapType: MapType.normal,
          onCameraMove: appState.onCameraMove,
          compassEnabled: true,
          markers: {
            Marker(
                markerId: MarkerId(uuid.v4()),
                position: appState.initialPosition,
                infoWindow: InfoWindow(title: 'My Location', snippet: "go here"),
                icon: BitmapDescriptor.defaultMarker),
            Marker(
              markerId: MarkerId(uuid.v4()),
              position: appState.info.riderLocation,
              infoWindow: InfoWindow(title: 'Rider Location', snippet: "go here"),
              icon: BitmapDescriptor.defaultMarker),
              },
          polylines: {
            Polyline(
              polylineId: const PolylineId('overview_polyline'),
              color: Colors.red,
              width: 5,
              points: PolylinePoints().decodePolyline(appState.info.route)
                  .map((e) => LatLng(e.latitude, e.longitude))
                  .toList(),
            ),
          },
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
                      appState.scaffoldKey.currentState.openDrawer();
                    },
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
    );
  }







}