import 'package:cabgo_driver/index.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../states/app_state.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();


  void _delete(BuildContext context,AppState appState) {

    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove this account, You will lose all your Benefits'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async{
                    try {
                      await appState.delete();
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWidget(),
                          ),
                        );
                    } catch (e) {
                    Navigator.of(context).pop();
                    }
                    
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    const snackBar = SnackBar(
      content: Text('Something went wrong uploading Document'),
    );
    const snackBarStorage = SnackBar(
      content: Text('Something went wrong uploading Document'),
    );

    ProgressDialog pr = ProgressDialog(context);
    pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);


    pr.style(
        message: 'Loading....please wait.',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Colors.black), strokeWidth: 2,),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600)
    );
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 304,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color(0xFF4B39EF),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.7, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(26),
                                  child: appState.driver.picture!=null?
                                  Image.network(
                                    appState.driver.picture,
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
                                )
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.7, 0),
                                  child: Icon(
                                    Icons.edit_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                appState.driver.fullName,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                appState.driver.email,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFEE8B60),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Image.asset(
                                      'assets/images/card_header@2x.png',
                                      width: MediaQuery.of(context).size.width,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 105, 0, 0),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(26),
                                          child: appState.driver.picture!=null?
                                          Image.network(
                                            appState.driver.picture,
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
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                appState.driver.fullName,
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                appState.driver.email,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),

                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                appState.driver.phone,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                  child: Text(
                    'Account Settings',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ],
            ),
           SingleChildScrollView(
             child: Column(
               children: <Widget>[
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () async{
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(1);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Padding(
                             padding:
                             EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                             child: Icon(
                               Icons.file_copy,
                               color: FlutterFlowTheme.of(context).primaryColor,
                               size: 24,
                             ),
                           ),
                           Padding(
                             padding:
                             EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                             child: Text(
                               'Upload  Licence with PDP',
                               style: FlutterFlowTheme.of(context)
                                   .bodyText1
                                   .override(
                                 fontFamily: 'Red Hat Display',
                                 fontWeight: FontWeight.w300,
                               ),
                             ),
                           ),
                                IconButton(
                                 icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                               ),
                         ],


                       ),

                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(3);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Icon(
                                 Icons.file_copy,
                                 color: FlutterFlowTheme.of(context).primaryColor,
                                 size: 24,
                               ),
                             ),
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Text(
                                 'Driver Photo',
                                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                   fontFamily: 'Red Hat Display',
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ),
                             IconButton(
                               icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                             ),
                           ],


                         ),),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(15);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Icon(
                                 Icons.file_copy,
                                 color: FlutterFlowTheme.of(context).primaryColor,
                                 size: 24,
                               ),
                             ),
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Text(
                                 'Proof of Address',
                                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                   fontFamily: 'Red Hat Display',
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ),
                             IconButton(
                               icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                             ),
                           ],


                         ),),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(14);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Icon(
                                 Icons.file_copy,
                                 color: FlutterFlowTheme.of(context).primaryColor,
                                 size: 24,
                               ),
                             ),
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Text(
                                 'ID COPY',
                                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                   fontFamily: 'Red Hat Display',
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ),
                             IconButton(
                               icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                             ),
                           ],


                         ),),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(17);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Icon(
                                 Icons.file_copy,
                                 color: FlutterFlowTheme.of(context).primaryColor,
                                 size: 24,
                               ),
                             ),
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Text(
                                 'Police Clearance',
                                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                   fontFamily: 'Red Hat Display',
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ),
                             IconButton(
                               icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                             ),
                           ],


                         ),),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(18);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Icon(
                                 Icons.file_copy,
                                 color: FlutterFlowTheme.of(context).primaryColor,
                                 size: 24,
                               ),
                             ),
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Text(
                                 'NATIS Certificate',
                                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                   fontFamily: 'Red Hat Display',
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ),
                             IconButton(
                               icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                             ),
                           ],


                         ),),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           {
                             try {
                               if(appState.storagePermission == PermissionStatus.granted) {
                                 appState.uploadDocument(19);
                               }else if(appState.storagePermission == PermissionStatus.denied) {
                                 ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                               }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                                 openAppSettings();
                               }
                             }catch(e){
                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             }
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Icon(
                                 Icons.file_copy,
                                 color: FlutterFlowTheme.of(context).primaryColor,
                                 size: 24,
                               ),
                             ),
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Text(
                                 'Car Permit',
                                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                   fontFamily: 'Red Hat Display',
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ),
                             IconButton(
                               icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                             ),
                           ],


                         ),),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(20);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Icon(
                                 Icons.file_copy,
                                 color: FlutterFlowTheme.of(context).primaryColor,
                                 size: 24,
                               ),
                             ),
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: Text(
                                 'Bank Statement',
                                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                   fontFamily: 'Red Hat Display',
                                   fontWeight: FontWeight.w300,
                                 ),
                               ),
                             ),
                             IconButton(
                               icon: Icon(Icons.drive_folder_upload, size: 18.0 ,),
                             ),
                           ],


                         ),),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width,
                       height: 50,
                       decoration: BoxDecoration(
                         color: FlutterFlowTheme.of(context).secondaryBackground,
                         shape: BoxShape.rectangle,
                         border: Border.all(
                           color: FlutterFlowTheme.of(context).primaryBackground,
                           width: 1,
                         ),
                       ),

                       child: GestureDetector(
                         onTap: () {
                           try {
                             if(appState.storagePermission == PermissionStatus.granted) {
                               appState.uploadDocument(20);
                             }else if(appState.storagePermission == PermissionStatus.denied) {
                               ScaffoldMessenger.of(context).showSnackBar(snackBarStorage);
                             }else if(appState.storagePermission == PermissionStatus.permanentlyDenied) {
                               openAppSettings();
                             }
                           }catch(e){
                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           }
                         },
                         child :Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                            
                             Padding(
                               padding:
                               EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                               child: TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: const TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () {
                                         _delete(context,appState);
                                      },
                                      child: const Text('Delete Account'),
                                    ),
                             ),
                             
                           ],


                         ),),
                     ),
                   ],
                 ),

               ],
             ),
           )
            
          ],
        ),
      ),
    );
  }
}
