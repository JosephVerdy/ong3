import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'addresses_record.g.dart';

abstract class AddressesRecord implements Built<AddressesRecord, AddressesRecordBuilder> {
  static Serializer<AddressesRecord> get serializer => _$addressesRecordSerializer;

  String? get city;

  String? get civility;

  String? get country;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  String? get zipcode;

  String? get name;

  String? get address;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AddressesRecordBuilder builder) => builder
    ..city = ''
    ..civility = ''
    ..country = ''
    ..firstName = ''
    ..lastName = ''
    ..zipcode = ''
    ..name = ''
    ..address = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) => parent != null ? parent.collection('addresses') : FirebaseFirestore.instance.collectionGroup('addresses');

  static DocumentReference createDoc(DocumentReference parent) => parent.collection('addresses').doc();

  static Stream<AddressesRecord> getDocument(DocumentReference ref) => ref.snapshots().map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AddressesRecord> getDocumentOnce(DocumentReference ref) => ref.get().then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AddressesRecord._();
  factory AddressesRecord([void Function(AddressesRecordBuilder) updates]) = _$AddressesRecord;

  static AddressesRecord getDocumentFromData(Map<String, dynamic> data, DocumentReference reference) => serializers.deserializeWith(serializer, {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAddressesRecordData({
  String? city,
  String? civility,
  String? country,
  String? firstName,
  String? lastName,
  String? zipcode,
  String? name,
  String? address,
}) {
  final firestoreData = serializers.toFirestore(
    AddressesRecord.serializer,
    AddressesRecord(
      (a) => a
        ..city = city
        ..civility = civility
        ..country = country
        ..firstName = firstName
        ..lastName = lastName
        ..zipcode = zipcode
        ..name = name
        ..address = address,
    ),
  );

  return firestoreData;
}
