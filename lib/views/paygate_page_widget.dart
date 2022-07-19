import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaygatePageWidget extends StatefulWidget {
  const PaygatePageWidget({Key key}) : super(key: key);

  @override
  _PaygatePageWidgetState createState() => _PaygatePageWidgetState();
}

class _PaygatePageWidgetState extends State<PaygatePageWidget> {
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
            context.pop();
          },
        ),
        title: Text(
          'Paygate Payment',
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                    child: FlutterFlowCreditCardForm(
                      formKey: creditCardFormKey,
                      creditCardModel: creditCardInfo,
                      obscureNumber: true,
                      obscureCvv: false,
                      spacing: 10,
                      textStyle: GoogleFonts.getFont(
                        'Roboto',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                      inputDecoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF9E9E9E),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF9E9E9E),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
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
