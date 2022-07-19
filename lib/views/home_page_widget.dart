import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_page_widget.dart';
import 'register_page_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 500,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 50),
                                  child: PageView(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 0),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            'assets/images/lite.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.contain,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 14, 0, 0),
                                            child: Text(
                                              'WELCOME',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily:
                                                            'Red Hat Display',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Introducing CabGo Driver to take rides from the CabGo Cabs app users',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Red Hat Display',
                                                  color: Color(0xFF9E9E9E),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            'assets/images/Express.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 40, 0, 0),
                                            child: Text(
                                              'DRIVE',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily:
                                                            'Red Hat Display',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Be your own  boss, set your own schedule . Get the latest driving features all in one spot.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Red Hat Display',
                                                  color: Color(0xFF9E9E9E),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            'assets/images/Cash_40x40pt.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 40, 0, 0),
                                            child: Text(
                                              'Earn',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily:
                                                            'Red Hat Display',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            'Get well paid to help out strangers get to where they need  to go , withdraw your earnings every week/monthly.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Red Hat Display',
                                                  color: Color(0xFF9E9E9E),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: SmoothPageIndicator(
                                      controller: pageViewController ??=
                                          PageController(initialPage: 0),
                                      count: 3,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) {
                                        pageViewController.animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: ExpandingDotsEffect(
                                        expansionFactor: 2,
                                        spacing: 8,
                                        radius: 16,
                                        dotWidth: 16,
                                        dotHeight: 16,
                                        dotColor: Color(0xFF9E9E9E),
                                        activeDotColor: Color(0xFF090F13),
                                        paintStyle: PaintingStyle.stroke,
                                      ),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPageWidget(),
                                  ),
                                );
                              },
                              text: 'Sign In',
                              options: FFButtonOptions(
                                width: 130,
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
                                borderRadius: 5,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPageWidget(),
                                  ),
                                );
                              },
                              text: 'Sign Up',
                              options: FFButtonOptions(
                                width: 130,
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
                                borderRadius: 5,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  context.pushNamed('SocialsPage');
                                },
                                child: Text(
                                  'Or connect with socials',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Red Hat Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                            ],
                          ).animated([animationsMap['rowOnPageLoadAnimation']]),
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
