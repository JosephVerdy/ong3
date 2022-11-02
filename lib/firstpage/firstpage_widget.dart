import '../auth/auth_util.dart';
import '../backend/schema/users_record.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forgotpassword/forgotpassword_widget.dart';
import '../main.dart';
import 'package:flutter/material.dart';

class FirstpageWidget extends StatefulWidget {
  const FirstpageWidget({Key? key}) : super(key: key);

  @override
  _FirstpageWidgetState createState() => _FirstpageWidgetState();
}

class _FirstpageWidgetState extends State<FirstpageWidget> {
  TextEditingController? tFDisplaynameController;
  TextEditingController? tFEmailController;
  TextEditingController? tFPassController;

  late bool tFPassVisibility;
  TextEditingController? tFconfimpassController;

  late bool tFconfimpassVisibility;
  TextEditingController? tFemailloginController;
  TextEditingController? tFpassloginController;

  late bool tFpassloginVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tFDisplaynameController = TextEditingController();
    tFEmailController = TextEditingController();
    tFPassController = TextEditingController();
    tFPassVisibility = false;
    tFconfimpassController = TextEditingController();
    tFconfimpassVisibility = false;
    tFemailloginController = TextEditingController();
    tFpassloginController = TextEditingController();
    tFpassloginVisibility = false;
  }

  @override
  void dispose() {
    tFDisplaynameController?.dispose();
    tFEmailController?.dispose();
    tFPassController?.dispose();
    tFconfimpassController?.dispose();
    tFemailloginController?.dispose();
    tFpassloginController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/logo_sliced.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primaryColor,
                          labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Noto Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                          indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                          tabs: [
                            Tab(
                              text: 'Sign up',
                            ),
                            Tab(
                              text: 'Login',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: TextFormField(
                                      controller: tFDisplaynameController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Name',
                                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: TextFormField(
                                      controller: tFEmailController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: TextFormField(
                                      controller: tFPassController,
                                      autofocus: true,
                                      obscureText: !tFPassVisibility,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => tFPassVisibility = !tFPassVisibility,
                                          ),
                                          focusNode: FocusNode(skipTraversal: true),
                                          child: Icon(
                                            tFPassVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: TextFormField(
                                      controller: tFconfimpassController,
                                      autofocus: true,
                                      obscureText: !tFconfimpassVisibility,
                                      decoration: InputDecoration(
                                        hintText: 'Confirm password',
                                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => tFconfimpassVisibility = !tFconfimpassVisibility,
                                          ),
                                          focusNode: FocusNode(skipTraversal: true),
                                          child: Icon(
                                            tFconfimpassVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (tFPassController?.text != tFconfimpassController?.text) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Passwords don\'t match!',
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        final user = await createAccountWithEmail(
                                          context,
                                          tFEmailController!.text,
                                          tFPassController!.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        final usersCreateData = createUsersRecordData(
                                          displayName: tFDisplaynameController!.text,
                                        );
                                        await UsersRecord.collection.doc(user.uid).update(usersCreateData);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(initialPage: 'Home'),
                                          ),
                                        );
                                      },
                                      text: 'Create account',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context).primaryColor,
                                        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                              fontFamily: 'Noto Sans',
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(initialPage: 'Home'),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'or do it later',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: TextFormField(
                                      controller: tFemailloginController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                    child: TextFormField(
                                      controller: tFpassloginController,
                                      autofocus: true,
                                      obscureText: !tFpassloginVisibility,
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => tFpassloginVisibility = !tFpassloginVisibility,
                                          ),
                                          focusNode: FocusNode(skipTraversal: true),
                                          child: Icon(
                                            tFpassloginVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                  ),
                                  if (FFAppState().incorrectpassword)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                      child: Text(
                                        'Incorrect password',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => FFAppState().incorrectpassword = true);

                                        final user = await signInWithEmail(
                                          context,
                                          tFemailloginController!.text,
                                          tFpassloginController!.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(initialPage: 'Home'),
                                          ),
                                        );
                                      },
                                      text: 'Login',
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context).primaryColor,
                                        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                              fontFamily: 'Noto Sans',
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ForgotpasswordWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Forgot your password',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
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
          ),
        ),
      ),
    );
  }
}
