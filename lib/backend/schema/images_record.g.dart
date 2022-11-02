// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImagesRecord> _$imagesRecordSerializer = new _$ImagesRecordSerializer();

class _$ImagesRecordSerializer implements StructuredSerializer<ImagesRecord> {
  @override
  final Iterable<Type> types = const [ImagesRecord, _$ImagesRecord];
  @override
  final String wireName = 'ImagesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ImagesRecord object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.path;
    if (value != null) {
      result
        ..add('path')
        ..add(serializers.serialize(value, specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value, specifiedType: const FullType(DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ImagesRecord deserialize(Serializers serializers, Iterable<Object?> serialized, {FullType specifiedType = FullType.unspecified}) {
    final result = new ImagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'path':
          result.path = serializers.deserialize(value, specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value, specifiedType: const FullType(DocumentReference, const [const FullType.nullable(Object)])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ImagesRecord extends ImagesRecord {
  @override
  final String? path;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ImagesRecord([void Function(ImagesRecordBuilder)? updates]) => (new ImagesRecordBuilder()..update(updates))._build();

  _$ImagesRecord._({this.path, this.ffRef}) : super._();

  @override
  ImagesRecord rebuild(void Function(ImagesRecordBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  ImagesRecordBuilder toBuilder() => new ImagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImagesRecord && path == other.path && ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(($jc(0, path.hashCode)), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ImagesRecord')
          ..add('path', path)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ImagesRecordBuilder implements Builder<ImagesRecord, ImagesRecordBuilder> {
  _$ImagesRecord? _$v;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ImagesRecordBuilder() {
    ImagesRecord._initializeBuilder(this);
  }

  ImagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImagesRecord;
  }

  @override
  void update(void Function(ImagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ImagesRecord build() => _build();

  _$ImagesRecord _build() {
    final _$result = _$v ?? new _$ImagesRecord._(path: path, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
