// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ong_types_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OngTypesRecord> _$ongTypesRecordSerializer =
    new _$OngTypesRecordSerializer();

class _$OngTypesRecordSerializer
    implements StructuredSerializer<OngTypesRecord> {
  @override
  final Iterable<Type> types = const [OngTypesRecord, _$OngTypesRecord];
  @override
  final String wireName = 'OngTypesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OngTypesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  OngTypesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OngTypesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$OngTypesRecord extends OngTypesRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OngTypesRecord([void Function(OngTypesRecordBuilder)? updates]) =>
      (new OngTypesRecordBuilder()..update(updates))._build();

  _$OngTypesRecord._({this.name, this.ffRef}) : super._();

  @override
  OngTypesRecord rebuild(void Function(OngTypesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OngTypesRecordBuilder toBuilder() =>
      new OngTypesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OngTypesRecord &&
        name == other.name &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OngTypesRecord')
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OngTypesRecordBuilder
    implements Builder<OngTypesRecord, OngTypesRecordBuilder> {
  _$OngTypesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OngTypesRecordBuilder() {
    OngTypesRecord._initializeBuilder(this);
  }

  OngTypesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OngTypesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OngTypesRecord;
  }

  @override
  void update(void Function(OngTypesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OngTypesRecord build() => _build();

  _$OngTypesRecord _build() {
    final _$result = _$v ?? new _$OngTypesRecord._(name: name, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
