// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ongs_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OngsRecord> _$ongsRecordSerializer = new _$OngsRecordSerializer();

class _$OngsRecordSerializer implements StructuredSerializer<OngsRecord> {
  @override
  final Iterable<Type> types = const [OngsRecord, _$OngsRecord];
  @override
  final String wireName = 'OngsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OngsRecord object,
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
    value = object.types;
    if (value != null) {
      result
        ..add('types')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  OngsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OngsRecordBuilder();

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
        case 'types':
          result.types.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$OngsRecord extends OngsRecord {
  @override
  final String? name;
  @override
  final BuiltList<DocumentReference<Object?>>? types;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OngsRecord([void Function(OngsRecordBuilder)? updates]) =>
      (new OngsRecordBuilder()..update(updates))._build();

  _$OngsRecord._({this.name, this.types, this.ffRef}) : super._();

  @override
  OngsRecord rebuild(void Function(OngsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OngsRecordBuilder toBuilder() => new OngsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OngsRecord &&
        name == other.name &&
        types == other.types &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), types.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OngsRecord')
          ..add('name', name)
          ..add('types', types)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OngsRecordBuilder implements Builder<OngsRecord, OngsRecordBuilder> {
  _$OngsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<DocumentReference<Object?>>? _types;
  ListBuilder<DocumentReference<Object?>> get types =>
      _$this._types ??= new ListBuilder<DocumentReference<Object?>>();
  set types(ListBuilder<DocumentReference<Object?>>? types) =>
      _$this._types = types;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OngsRecordBuilder() {
    OngsRecord._initializeBuilder(this);
  }

  OngsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _types = $v.types?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OngsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OngsRecord;
  }

  @override
  void update(void Function(OngsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OngsRecord build() => _build();

  _$OngsRecord _build() {
    _$OngsRecord _$result;
    try {
      _$result = _$v ??
          new _$OngsRecord._(name: name, types: _types?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'types';
        _types?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OngsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
