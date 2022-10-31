import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class ChooseSubCategoryWidget extends StatefulWidget {
  const ChooseSubCategoryWidget({Key? key, required this.category}) : super(key: key);

  final CategoriesRecord category;

  @override
  _ChooseSubCategoryWidgetState createState() => _ChooseSubCategoryWidgetState();
}

class _ChooseSubCategoryWidgetState extends State<ChooseSubCategoryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            size: 25,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Choose SubCategory',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryColor,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: StreamBuilder<List<SubCategoryRecord>>(
              stream: querySubCategoryRecord(parent: widget.category.reference),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: LinearProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  );
                }
                List<SubCategoryRecord> columnCategoriesRecordList = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(columnCategoriesRecordList.length, (columnIndex) {
                    final columnSubCategoryRecord = columnCategoriesRecordList[columnIndex];
                    return InkWell(
                      onTap: () async {
                        Navigator.pop(context, columnSubCategoryRecord);
                      },
                      child: ListTile(
                        title: Text(
                          columnSubCategoryRecord.name ?? "no name",
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF303030),
                          size: 20,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
