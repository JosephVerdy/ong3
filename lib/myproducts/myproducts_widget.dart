import '../addproduct/addproduct_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '../ongs/ongs.dart';
import '../prod_detail/prod_detail_widget.dart';
import '../favorites/favorite_icon_widget.dart';
import '../auth/auth_util.dart';

class MyProductsWidget extends StatefulWidget {
  const MyProductsWidget({Key? key}) : super(key: key);

  @override
  _MyProductsWidgetState createState() => _MyProductsWidgetState();
}

class _MyProductsWidgetState extends State<MyProductsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My products',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Noto Sans',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: StreamBuilder<List<ProductsRecord>>(
              stream: queryProductsRecord(
                queryBuilder: (productsRecord) => productsRecord.where('vendor', isEqualTo: currentUserReference).orderBy('created_date', descending: true),
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
                List<ProductsRecord> listViewProductsRecordList = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewProductsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewProductsRecord = listViewProductsRecordList[listViewIndex];
                    return Container(
                      height: 166,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProdDetailWidget(
                                productreffromhomepage: listViewProductsRecord.reference,
                              ),
                            ),
                          );
                        },
                        child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                listViewProductsRecord.thumbnail!,
                                width: 146,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Generated code for this Column Widget...
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        Ongs.getOngName(listViewProductsRecord.ong),
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                      FavoriteIconWidget(productParameter: listViewProductsRecord),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: Text(
                                    listViewProductsRecord.title!,
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                  child: Text(
                                    listViewProductsRecord.description!,
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 10),
                                  child: Text(
                                    listViewProductsRecord.price!.toString(),
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddproductWidget(
                                            product: listViewProductsRecord,
                                          ),
                                        ),
                                      );
                                      setState(() {});
                                    },
                                    text: 'Edit',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 30,
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
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
