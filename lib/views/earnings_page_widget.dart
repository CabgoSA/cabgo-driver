import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

import '../states/app_state.dart';

class EarningsPageWidget extends StatefulWidget {
  const EarningsPageWidget({Key key}) : super(key: key);

  @override
  _EarningsPageWidgetState createState() => _EarningsPageWidgetState();
}

class _EarningsPageWidgetState extends State<EarningsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
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
            Icons.arrow_back_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Earnings',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Red Hat Display',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
          child: Column(

            mainAxisSize: MainAxisSize.max,
            children: [

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffD1090F13),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(

                            children: [
                              Text('Wallet Balance',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white
                                ),
                              ),
                              Text('R'+appState.earnings['daily'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32,
                                      color: Colors.white
                                  )
                              ),
                            ],
                          ),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Due on: ',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                            ),
                          ),

                          Text('31 August 2022',
                              style: TextStyle(

                                  fontSize: 14,
                                  color: Colors.white
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ),

              Padding(
                  padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffD1090F13),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Column(

                                        children: [

                                          Text(
                                            'R'+appState.earnings['daily'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.white
                                              )
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                            )
                        ),
                        Text(
                          'Today’s Earnings',
                          style: TextStyle(
                              fontSize: 12
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffD1090F13),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Column(

                                        children: [

                                          Text(
                                              'R'+appState.earnings['weekly'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.white
                                              )
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                            )
                        ),
                        Text(
                          'Weekly’s Earnings',
                          style: TextStyle(
                              fontSize: 12
                          ),
                        )
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xffD1090F13),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Column(

                                        children: [

                                          Text(
                                              'R'+appState.earnings['monthly'].toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.white
                                              )
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                            )
                        ),
                        Text(
                          'Montly’s Earnings',
                          style: TextStyle(
                              fontSize: 12
                          ),
                        )
                      ],
                    ),

                  ],
                )

                ,

              ),


             // Padding(
             //   padding: const EdgeInsets.only(top: 50),
             // child:  SizedBox(
             //   width: double.infinity,
             //   height: 50,
             //   child: TextButton(
             //     style: ButtonStyle(
             //         backgroundColor: MaterialStateProperty.all(Color(0xff090F13))
             //     ),
             //     child: Text('Cash Out',
             //       style: TextStyle(
             //           fontSize: 18,
             //           fontWeight: FontWeight.w700,
             //           color: Colors.white
             //       ),
             //     ),
             //   ),
             // ),
             // ),

            ],
          ),
        ),
      ),
    );
  }
}
