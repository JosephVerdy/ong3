import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer => _$productsRecordSerializer;

  String? get title;

  String? get description;

  double? get price;

  DocumentReference? get ong;

  String? get thumbnail;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  DocumentReference? get vendor;

  DocumentReference? get buyer;

  @BuiltValueField(wireName: 'sub_category')
  DocumentReference? get subCategory;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..price = 0.0
    ..thumbnail = ''
    ..createdDate = DateTime.now();

  static CollectionReference get collection => FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref.snapshots().map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref.get().then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) = _$ProductsRecord;

  static ProductsRecord getDocumentFromData(Map<String, dynamic> data, DocumentReference reference) => serializers.deserializeWith(serializer, {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductsRecordData({
  String? title,
  String? description,
  double? price,
  DocumentReference? ong,
  String? thumbnail,
  DateTime? createdDate,
  DocumentReference? vendor,
  DocumentReference? buyer,
  DocumentReference? subCategory,
}) {
  final firestoreData = serializers.toFirestore(
    ProductsRecord.serializer,
    ProductsRecord((p) => p
      ..title = title
      ..description = description
      ..price = price
      ..ong = ong
      ..thumbnail = thumbnail
      ..createdDate = createdDate
      ..vendor = vendor
      ..buyer = buyer
      ..subCategory = subCategory),
  );

  return firestoreData;
}
