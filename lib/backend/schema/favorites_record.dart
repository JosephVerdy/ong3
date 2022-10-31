import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'favorites_record.g.dart';

abstract class FavoritesRecord
    implements Built<FavoritesRecord, FavoritesRecordBuilder> {
  static Serializer<FavoritesRecord> get serializer =>
      _$favoritesRecordSerializer;

  DocumentReference? get product;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(FavoritesRecordBuilder builder) => builder;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('favorites')
          : FirebaseFirestore.instance.collectionGroup('favorites');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('favorites').doc();

  static Stream<FavoritesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FavoritesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FavoritesRecord._();
  factory FavoritesRecord([void Function(FavoritesRecordBuilder) updates]) =
      _$FavoritesRecord;

  static FavoritesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFavoritesRecordData({
  DocumentReference? product,
}) {
  final firestoreData = serializers.toFirestore(
    FavoritesRecord.serializer,
    FavoritesRecord(
      (f) => f..product = product,
    ),
  );

  return firestoreData;
}
