import '../backend/backend.dart';
import '../chatpage/chatpage_widget.dart';
import '../checkout_cart/checkout_cart_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProdDetailWidget extends StatefulWidget {
  const ProdDetailWidget({
    Key? key,
    this.productreffromhomepage,
  }) : super(key: key);

  final DocumentReference? productreffromhomepage;

  @override
  _ProdDetailWidgetState createState() => _ProdDetailWidgetState();
}

class _ProdDetailWidgetState extends State<ProdDetailWidget> {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductsRecord>(
      stream: ProductsRecord.getDocument(widget.productreffromhomepage!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          );
        }
        final prodDetailProductsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 25,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 25,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'Search'),
                  ),
                );
              },
            ),
            title: Text(
              'Page Title',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Noto Sans',
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontSize: 22,
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  FFIcons.kshare1,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<ImagesRecord>>(
                      stream: queryImagesRecord(
                        parent: widget.productreffromhomepage,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: LinearProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          );
                        }
                        List<ImagesRecord> pageViewImagesRecordList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: 500,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: PageView.builder(
                                  controller: pageViewController ??= PageController(initialPage: min(0, pageViewImagesRecordList.length - 1)),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: pageViewImagesRecordList.length,
                                  itemBuilder: (context, pageViewIndex) {
                                    final pageViewImagesRecord = pageViewImagesRecordList[pageViewIndex];
                                    return StreamBuilder<ImagesRecord>(
                                      stream: ImagesRecord.getDocument(pageViewImagesRecord.reference),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: LinearProgressIndicator(
                                              color: FlutterFlowTheme.of(context).primaryColor,
                                            ),
                                          );
                                        }
                                        final imageImagesRecord = snapshot.data!;
                                        return Image.network(
                                          imageImagesRecord.path!,
                                          width: 100,
                                          height: 300,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                  child: smooth_page_indicator.SmoothPageIndicator(
                                    controller: pageViewController ??= PageController(initialPage: min(0, pageViewImagesRecordList.length - 1)),
                                    count: pageViewImagesRecordList.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator.SlideEffect(
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 5,
                                      dotHeight: 5,
                                      dotColor: Color(0xFF9E9E9E),
                                      activeDotColor: Color(0xFF3F51B5),
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StreamBuilder<OngsRecord>(
                          stream: OngsRecord.getDocument(prodDetailProductsRecord.ong!),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: LinearProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                ),
                              );
                            }
                            final textOngsRecord = snapshot.data!;
                            return Text(
                              textOngsRecord.name!,
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            );
                          },
                        ),
                        Text(
                          prodDetailProductsRecord.price!.toString(),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Noto Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            prodDetailProductsRecord.title!,
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Noto Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AutoSizeText(
                          prodDetailProductsRecord.description!,
                          style: FlutterFlowTheme.of(context).subtitle1.override(
                                fontFamily: 'Noto Sans',
                                color: FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(prodDetailProductsRecord.vendor!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: LinearProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          );
                        }
                        final rowTimeUsersRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                rowTimeUsersRecord.photoUrl!,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                rowTimeUsersRecord.displayName!,
                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(prodDetailProductsRecord.vendor!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: LinearProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          );
                        }
                        final buttonchatUsersRecord = snapshot.data!;
                        return FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatpageWidget(
                                  chatUser: buttonchatUsersRecord,
                                ),
                              ),
                            );
                          },
                          text: 'Chat',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            textStyle: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Noto Sans',
                                  color: FlutterFlowTheme.of(context).black600,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).black600,
                              width: 1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 24),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutCartWidget(),
                          ),
                        );
                      },
                      text: 'Buy',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Noto Sans',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
