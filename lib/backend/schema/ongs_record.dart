import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ongs_record.g.dart';

abstract class OngsRecord implements Built<OngsRecord, OngsRecordBuilder> {
  static Serializer<OngsRecord> get serializer => _$ongsRecordSerializer;

  String? get name;

  BuiltList<DocumentReference>? get types;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OngsRecordBuilder builder) => builder
    ..name = ''
    ..types = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ongs');

  static Stream<OngsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OngsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OngsRecord._();
  factory OngsRecord([void Function(OngsRecordBuilder) updates]) = _$OngsRecord;

  static OngsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOngsRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    OngsRecord.serializer,
    OngsRecord(
      (o) => o
        ..name = name
        ..types = null,
    ),
  );

  return firestoreData;
}
