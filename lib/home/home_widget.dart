import '../backend/backend.dart';
import '../favorites/favorites.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../prod_detail/prod_detail_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../favorites/favorite_icon_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<ProductsRecord> simpleSearchResults = [];
  final tFSearchKey = GlobalKey();
  TextEditingController? tFSearchController;
  String? tFSearchSelectedOption;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  _HomeWidgetState() {
    Favorites.loadFavorites();
  }

  @override
  void initState() {
    super.initState();
    tFSearchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFE6E6E6),
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryBackground,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Autocomplete<String>(
                                    initialValue: TextEditingValue(),
                                    optionsBuilder: (textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      return ['Option 1'].where((option) {
                                        final lowercaseOption = option.toLowerCase();
                                        return lowercaseOption.contains(textEditingValue.text.toLowerCase());
                                      });
                                    },
                                    optionsViewBuilder: (context, onSelected, options) {
                                      return AutocompleteOptionsList(
                                        textFieldKey: tFSearchKey,
                                        textController: tFSearchController!,
                                        options: options.toList(),
                                        onSelected: onSelected,
                                        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                              fontFamily: 'Noto Sans',
                                              color: FlutterFlowTheme.of(context).primaryColor,
                                            ),
                                        textHighlightStyle: TextStyle(),
                                        elevation: 4,
                                        optionBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                        optionHighlightColor: FlutterFlowTheme.of(context).secondaryBackground,
                                        maxHeight: 200,
                                      );
                                    },
                                    onSelected: (String selection) {
                                      setState(() => tFSearchSelectedOption = selection);
                                      FocusScope.of(context).unfocus();
                                    },
                                    fieldViewBuilder: (
                                      context,
                                      textEditingController,
                                      focusNode,
                                      onEditingComplete,
                                    ) {
                                      tFSearchController = textEditingController;
                                      return TextFormField(
                                        key: tFSearchKey,
                                        controller: textEditingController,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Search',
                                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedErrorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                              fontFamily: 'Noto Sans',
                                              color: FlutterFlowTheme.of(context).primaryColor,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.95, 0),
                                    child: Icon(
                                      Icons.tune_rounded,
                                      color: FlutterFlowTheme.of(context).primaryColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 0, 12),
                      child: Text(
                        'Recommended for you',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Text(
                          'View All',
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Noto Sans',
                                color: FlutterFlowTheme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    queryBuilder: (productsRecord) => productsRecord.where('title', isEqualTo: tFSearchController!.text != '' ? tFSearchController!.text : null).orderBy('created_date', descending: true),
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
                    List<ProductsRecord> wrapProductsRecordList = snapshot.data!;
                    return Wrap(
                      spacing: 2,
                      runSpacing: 4,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(wrapProductsRecordList.length, (wrapIndex) {
                        final wrapProductsRecord = wrapProductsRecordList[wrapIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProdDetailWidget(
                                    productreffromhomepage: wrapProductsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 1),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(2),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(2),
                                            child: CachedNetworkImage(
                                              imageUrl: wrapProductsRecord.thumbnail!,
                                              width: double.infinity,
                                              height: 160,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(1, 1),
                                          child: FavoriteIconWidget(productParameter: wrapProductsRecord),
                                        ),
                                      ],
                                    ),
                                    StreamBuilder<OngsRecord>(
                                      stream: OngsRecord.getDocument(wrapProductsRecord.ong!),
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
                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                fontFamily: 'Noto Sans',
                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        );
                                      },
                                    ),
                                    Text(
                                      wrapProductsRecord.title!,
                                      style: FlutterFlowTheme.of(context).subtitle1.override(
                                            fontFamily: 'Noto Sans',
                                            color: Color(0xFF101213),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                      child: Text(
                                        wrapProductsRecord.price!.toString(),
                                        style: FlutterFlowTheme.of(context).bodyText2.override(
                                              fontFamily: 'Noto Sans',
                                              color: Color(0xFF57636C),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
