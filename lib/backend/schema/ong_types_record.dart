import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ong_types_record.g.dart';

abstract class OngTypesRecord implements Built<OngTypesRecord, OngTypesRecordBuilder> {
  static Serializer<OngTypesRecord> get serializer => _$ongTypesRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OngTypesRecordBuilder builder) => builder..name = '';

  static CollectionReference get collection => FirebaseFirestore.instance.collection('ong_types');

  static Stream<OngTypesRecord> getDocument(DocumentReference ref) => ref.snapshots().map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OngTypesRecord> getDocumentOnce(DocumentReference ref) => ref.get().then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OngTypesRecord._();
  factory OngTypesRecord([void Function(OngTypesRecordBuilder) updates]) = _$OngTypesRecord;

  static OngTypesRecord getDocumentFromData(Map<String, dynamic> data, DocumentReference reference) => serializers.deserializeWith(serializer, {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOngTypesRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    OngTypesRecord.serializer,
    OngTypesRecord(
      (o) => o..name = name,
    ),
  );

  return firestoreData;
}
