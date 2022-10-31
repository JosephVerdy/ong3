// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryStruct> _$categoryStructSerializer =
    new _$CategoryStructSerializer();

class _$CategoryStructSerializer
    implements StructuredSerializer<CategoryStruct> {
  @override
  final Iterable<Type> types = const [CategoryStruct, _$CategoryStruct];
  @override
  final String wireName = 'CategoryStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoryStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CategoryStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryStructBuilder();

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
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryStruct extends CategoryStruct {
  @override
  final String? name;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CategoryStruct([void Function(CategoryStructBuilder)? updates]) =>
      (new CategoryStructBuilder()..update(updates))._build();

  _$CategoryStruct._({this.name, required this.firestoreUtilData}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CategoryStruct', 'firestoreUtilData');
  }

  @override
  CategoryStruct rebuild(void Function(CategoryStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryStructBuilder toBuilder() =>
      new CategoryStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryStruct &&
        name == other.name &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryStruct')
          ..add('name', name)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CategoryStructBuilder
    implements Builder<CategoryStruct, CategoryStructBuilder> {
  _$CategoryStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CategoryStructBuilder() {
    CategoryStruct._initializeBuilder(this);
  }

  CategoryStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryStruct;
  }

  @override
  void update(void Function(CategoryStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryStruct build() => _build();

  _$CategoryStruct _build() {
    final _$result = _$v ??
        new _$CategoryStruct._(
            name: name,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'CategoryStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
