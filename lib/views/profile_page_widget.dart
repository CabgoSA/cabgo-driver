import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../states/app_state.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/UI_avatar@2x.png',
                                  ),
                                ),
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
                                '[User Name]',
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
                                '[username@domain.com]',
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
                                        child: Image.asset(
                                          'assets/images/Work_40x40pt.png',
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
                                'name',
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'User.name@domainname.com',
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
                         onTap: () {
                            appState.uploadDocument(1);
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
                           appState.uploadDocument(3);
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
                           appState.uploadDocument(15);
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
                           appState.uploadDocument(14);
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
                           appState.uploadDocument(17);
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
                           appState.uploadDocument(18);
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
                           appState.uploadDocument(19);
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
                           appState.uploadDocument(20);
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

               ],
             ),
           )
            
          ],
        ),
      ),
    );
  }
}
