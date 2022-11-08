import 'package:ong3/favorites/favorites.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '../ongs/ongs.dart';
import 'favorite_icon_widget.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({Key? key}) : super(key: key);

  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: Favorites.favorites.length,
              itemBuilder: (context, listViewIndex) {
                final listViewFavoritesRecord = Favorites.favorites[listViewIndex];
                return StreamBuilder<ProductsRecord>(
                  stream: ProductsRecord.getDocument(listViewFavoritesRecord.product!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: LinearProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      );
                    }
                    final containerProductsRecord = snapshot.data!;
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
                      child: Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.network(
                              containerProductsRecord.thumbnail!,
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
                                      Ongs.getOngName(containerProductsRecord.ong),
                                      style: FlutterFlowTheme.of(context).bodyText1,
                                    ),
                                    FavoriteIconWidget(productParameter: containerProductsRecord),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  containerProductsRecord.title!,
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
                                  containerProductsRecord.description!,
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Noto Sans',
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 10),
                                child: Text(
                                  containerProductsRecord.price!.toString(),
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Noto Sans',
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'Buy',
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
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
