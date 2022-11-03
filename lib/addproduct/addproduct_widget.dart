import 'dart:io';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:ong3/index.dart';
import 'package:ong3/main.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth_page_indicator;

class AddproductWidget extends StatefulWidget {
  const AddproductWidget({Key? key, this.productRef}) : super(key: key);

  final DocumentReference? productRef;

  @override
  _AddproductWidgetState createState() => _AddproductWidgetState();
}

class _Image {
  bool isNew = false;
  XFile? file;
  ImagesRecord? record;

  _Image.fromFile(XFile file) {
    this.file = file;
    isNew = true;
  }

  _Image.fromRecord(ImagesRecord record) {
    this.record = record;
  }
}

class _AddproductWidgetState extends State<AddproductWidget> {
  PageController? pageViewController;
  TextEditingController? tFPriceController;
  TextEditingController? tFprodDescriptionController;
  TextEditingController? tFprodTitleController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageList = [];
  SubCategoryRecord? selectedSubCategory;
  OngsRecord? selectedOng;

  @override
  void initState() {
    super.initState();
    tFPriceController = TextEditingController();
    tFprodDescriptionController = TextEditingController();
    tFprodTitleController = TextEditingController();
  }

  @override
  void dispose() {
    tFPriceController?.dispose();
    tFprodDescriptionController?.dispose();
    tFprodTitleController?.dispose();
    super.dispose();
  }

  Future _openImagePicker() async {
    try {
      List<XFile> pickedFileList = await _picker.pickMultiImage();
      setState(() {
        _imageList.addAll(pickedFileList);
      });
    } catch (e) {}
  }

  Future<String?> uploadImage(String path, int maxWidth) async {
    ImageProperties properties = await FlutterNativeImage.getImageProperties(path);
    File compressedFile = await FlutterNativeImage.compressImage(path, quality: 90, targetWidth: maxWidth, targetHeight: (properties.height! * maxWidth / properties.width!).round());

    var ext = path.split('.').last;

    var timestamp = DateTime.now().microsecondsSinceEpoch;
    var storagePath = 'users/$currentUserUid/uploads/$timestamp.$ext';
    return await uploadData(storagePath, await compressedFile.readAsBytes());
  }

  Future _submit() async {
    if ((_imageList.length == 0 && widget.productRef != null) || selectedOng == null || selectedSubCategory == null || tFprodTitleController?.text == null || _imageList.length == 0) {
      return;
    }

    XFile thumbfile = _imageList[0];
    var thumbRef = await uploadImage(thumbfile.path, 400);

    final Map<String, dynamic> productRecord = createProductsRecordData(title: tFprodTitleController?.text, description: tFprodDescriptionController?.text, price: double.tryParse(tFPriceController?.text ?? "0"), createdDate: DateTime.now(), ong: selectedOng?.reference, subCategory: selectedSubCategory?.reference, vendor: currentUserReference, thumbnail: thumbRef);
    final productRef = await ProductsRecord.collection.add(productRecord);

    for (int i = 0; i < _imageList.length; i++) {
      XFile xfile = _imageList[i];
      var imageRef = await uploadImage(xfile.path, 800);
      if (imageRef != null) productRef.collection('images').add(createImagesRecordData(path: imageRef));
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavBarPage(initialPage: 'Search'),
      ),
    );
  }

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
            Icons.close,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [],
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<ImagesRecord>>(
                      stream: widget.productRef == null ? Stream<List<ImagesRecord>>.empty() : queryImagesRecord(parent: widget.productRef),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (widget.productRef != null && !snapshot.hasData) {
                          return Center(
                            child: LinearProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          );
                        }
                        List<_Image> pageViewImagesRecordList = [];
                        if (snapshot.data != null) pageViewImagesRecordList.addAll(snapshot.data!.map((e) => _Image.fromRecord(e)));

                        pageViewImagesRecordList.addAll(_imageList.map((e) => (_Image.fromFile(e))));

                        return Container(
                          width: double.infinity,
                          height: 400,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                                child: PageView.builder(
                                  controller: pageViewController ??= PageController(initialPage: pageViewImagesRecordList.length),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: pageViewImagesRecordList.length + 1,
                                  itemBuilder: (context, pageViewIndex) {
                                    if (pageViewIndex == pageViewImagesRecordList.length) {
                                      return FFButtonWidget(
                                        onPressed: _openImagePicker,
                                        text: 'Add photos',
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
                                      );
                                    } else {
                                      final pageViewImage = pageViewImagesRecordList[pageViewIndex];
                                      if (pageViewImage.isNew) {
                                        return Image.file(File(pageViewImage.file!.path), width: 100, height: 300, fit: BoxFit.cover);
                                      } else {
                                        return StreamBuilder<ImagesRecord>(
                                          stream: ImagesRecord.getDocument(pageViewImage.record!.reference),
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
                                      }
                                    }
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                  child: smooth_page_indicator.SmoothPageIndicator(
                                    controller: pageViewController ??= PageController(initialPage: pageViewImagesRecordList.length),
                                    count: pageViewImagesRecordList.length + 1,
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: tFprodTitleController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Product title',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Noto Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: TextFormField(
                              controller: tFprodDescriptionController,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Product description',
                                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.start,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                              /* validator: (val) {
                                  if (val?.isEmpty != false) {
                                    return 'Field is required';
                                  }
                                  return null;
                                }*/
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xEEEEEEEE),
                            ),
                            child: InkWell(
                              onTap: () async {
                                OngsRecord? newOng = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChooseOngTypeWidget(),
                                  ),
                                );
                                setState(() => selectedOng = newOng);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                      child: Text(
                                        selectedOng?.name ?? 'ONG',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF303030),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xEEEEEEEE),
                            ),
                            child: InkWell(
                              onTap: () async {
                                SubCategoryRecord? newSubCategory = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChooseCategoryWidget(),
                                  ),
                                );
                                setState(() => selectedSubCategory = newSubCategory);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                      child: Text(
                                        selectedSubCategory?.name ?? 'Category',
                                        style: FlutterFlowTheme.of(context).bodyText1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF303030),
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Container(
                                  width: 80,
                                  child: TextFormField(
                                    controller: tFPriceController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Price',
                                      hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                            fontFamily: 'Noto Sans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).primaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context).primaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context).bodyText1,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: FFButtonWidget(
                            onPressed: _submit,
                            text: 'Add product',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Noto Sans',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                ],
                //),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
