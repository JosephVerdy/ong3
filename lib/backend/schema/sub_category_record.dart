import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sub_category_record.g.dart';

abstract class SubCategoryRecord implements Built<SubCategoryRecord, SubCategoryRecordBuilder> {
  static Serializer<SubCategoryRecord> get serializer => _$subCategoryRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(SubCategoryRecordBuilder builder) => builder..name = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) => parent != null ? parent.collection('sub_category') : FirebaseFirestore.instance.collectionGroup('sub_category');

  static DocumentReference createDoc(DocumentReference parent) => parent.collection('sub_category').doc();

  static Stream<SubCategoryRecord> getDocument(DocumentReference ref) => ref.snapshots().map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SubCategoryRecord> getDocumentOnce(DocumentReference ref) => ref.get().then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SubCategoryRecord._();
  factory SubCategoryRecord([void Function(SubCategoryRecordBuilder) updates]) = _$SubCategoryRecord;

  static SubCategoryRecord getDocumentFromData(Map<String, dynamic> data, DocumentReference reference) => serializers.deserializeWith(serializer, {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSubCategoryRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    SubCategoryRecord.serializer,
    SubCategoryRecord(
      (s) => s..name = name,
    ),
  );

  return firestoreData;
}
