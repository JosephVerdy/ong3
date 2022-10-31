// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddressesRecord> _$addressesRecordSerializer =
    new _$AddressesRecordSerializer();

class _$AddressesRecordSerializer
    implements StructuredSerializer<AddressesRecord> {
  @override
  final Iterable<Type> types = const [AddressesRecord, _$AddressesRecord];
  @override
  final String wireName = 'AddressesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddressesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.civility;
    if (value != null) {
      result
        ..add('civility')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zipcode;
    if (value != null) {
      result
        ..add('zipcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
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
  AddressesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddressesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'civility':
          result.civility = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zipcode':
          result.zipcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
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

class _$AddressesRecord extends AddressesRecord {
  @override
  final String? city;
  @override
  final String? civility;
  @override
  final String? country;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? zipcode;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AddressesRecord([void Function(AddressesRecordBuilder)? updates]) =>
      (new AddressesRecordBuilder()..update(updates))._build();

  _$AddressesRecord._(
      {this.city,
      this.civility,
      this.country,
      this.firstName,
      this.lastName,
      this.zipcode,
      this.name,
      this.address,
      this.ffRef})
      : super._();

  @override
  AddressesRecord rebuild(void Function(AddressesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddressesRecordBuilder toBuilder() =>
      new AddressesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddressesRecord &&
        city == other.city &&
        civility == other.civility &&
        country == other.country &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        zipcode == other.zipcode &&
        name == other.name &&
        address == other.address &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, city.hashCode), civility.hashCode),
                                country.hashCode),
                            firstName.hashCode),
                        lastName.hashCode),
                    zipcode.hashCode),
                name.hashCode),
            address.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddressesRecord')
          ..add('city', city)
          ..add('civility', civility)
          ..add('country', country)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('zipcode', zipcode)
          ..add('name', name)
          ..add('address', address)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AddressesRecordBuilder
    implements Builder<AddressesRecord, AddressesRecordBuilder> {
  _$AddressesRecord? _$v;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _civility;
  String? get civility => _$this._civility;
  set civility(String? civility) => _$this._civility = civility;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _zipcode;
  String? get zipcode => _$this._zipcode;
  set zipcode(String? zipcode) => _$this._zipcode = zipcode;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AddressesRecordBuilder() {
    AddressesRecord._initializeBuilder(this);
  }

  AddressesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _city = $v.city;
      _civility = $v.civility;
      _country = $v.country;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _zipcode = $v.zipcode;
      _name = $v.name;
      _address = $v.address;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddressesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddressesRecord;
  }

  @override
  void update(void Function(AddressesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddressesRecord build() => _build();

  _$AddressesRecord _build() {
    final _$result = _$v ??
        new _$AddressesRecord._(
            city: city,
            civility: civility,
            country: country,
            firstName: firstName,
            lastName: lastName,
            zipcode: zipcode,
            name: name,
            address: address,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
