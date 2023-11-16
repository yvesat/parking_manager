// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingRecordModelCollection on Isar {
  IsarCollection<ParkingRecordModel> get parkingRecordModels =>
      this.collection();
}

const ParkingRecordModelSchema = CollectionSchema(
  name: r'ParkingRecordModel',
  id: -2774390995836157943,
  properties: {
    r'entryDate': PropertySchema(
      id: 0,
      name: r'entryDate',
      type: IsarType.dateTime,
    ),
    r'exitDate': PropertySchema(
      id: 1,
      name: r'exitDate',
      type: IsarType.dateTime,
    ),
    r'parkingRecordId': PropertySchema(
      id: 2,
      name: r'parkingRecordId',
      type: IsarType.long,
    ),
    r'parkingSlotNumber': PropertySchema(
      id: 3,
      name: r'parkingSlotNumber',
      type: IsarType.long,
    ),
    r'vehicleBrand': PropertySchema(
      id: 4,
      name: r'vehicleBrand',
      type: IsarType.string,
    ),
    r'vehicleId': PropertySchema(
      id: 5,
      name: r'vehicleId',
      type: IsarType.long,
    ),
    r'vehicleLicensePlate': PropertySchema(
      id: 6,
      name: r'vehicleLicensePlate',
      type: IsarType.string,
    ),
    r'vehicleModel': PropertySchema(
      id: 7,
      name: r'vehicleModel',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingRecordModelEstimateSize,
  serialize: _parkingRecordModelSerialize,
  deserialize: _parkingRecordModelDeserialize,
  deserializeProp: _parkingRecordModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _parkingRecordModelGetId,
  getLinks: _parkingRecordModelGetLinks,
  attach: _parkingRecordModelAttach,
  version: '3.1.0+1',
);

int _parkingRecordModelEstimateSize(
  ParkingRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.vehicleBrand.length * 3;
  bytesCount += 3 + object.vehicleLicensePlate.length * 3;
  bytesCount += 3 + object.vehicleModel.length * 3;
  return bytesCount;
}

void _parkingRecordModelSerialize(
  ParkingRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.entryDate);
  writer.writeDateTime(offsets[1], object.exitDate);
  writer.writeLong(offsets[2], object.parkingRecordId);
  writer.writeLong(offsets[3], object.parkingSlotNumber);
  writer.writeString(offsets[4], object.vehicleBrand);
  writer.writeLong(offsets[5], object.vehicleId);
  writer.writeString(offsets[6], object.vehicleLicensePlate);
  writer.writeString(offsets[7], object.vehicleModel);
}

ParkingRecordModel _parkingRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingRecordModel(
    entryDate: reader.readDateTime(offsets[0]),
    exitDate: reader.readDateTimeOrNull(offsets[1]),
    parkingRecordId: reader.readLong(offsets[2]),
    parkingSlotNumber: reader.readLong(offsets[3]),
    vehicleBrand: reader.readString(offsets[4]),
    vehicleId: reader.readLong(offsets[5]),
    vehicleLicensePlate: reader.readString(offsets[6]),
    vehicleModel: reader.readString(offsets[7]),
  );
  object.id = id;
  return object;
}

P _parkingRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingRecordModelGetId(ParkingRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _parkingRecordModelGetLinks(
    ParkingRecordModel object) {
  return [];
}

void _parkingRecordModelAttach(
    IsarCollection<dynamic> col, Id id, ParkingRecordModel object) {
  object.id = id;
}

extension ParkingRecordModelQueryWhereSort
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QWhere> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingRecordModelQueryWhere
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QWhereClause> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ParkingRecordModelQueryFilter
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QFilterCondition> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      entryDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      entryDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      entryDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      entryDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exitDate',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exitDate',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exitDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exitDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exitDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exitDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingRecordIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingRecordIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingRecordIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingRecordIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingRecordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingSlotNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSlotNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingSlotNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingSlotNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingSlotNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingSlotNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingSlotNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingSlotNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleBrand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleBrand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleBrand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleBrand',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleBrand',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleLicensePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleLicensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleLicensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleLicensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleLicensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleModel',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleModel',
        value: '',
      ));
    });
  }
}

extension ParkingRecordModelQueryObject
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QFilterCondition> {}

extension ParkingRecordModelQueryLinks
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QFilterCondition> {}

extension ParkingRecordModelQuerySortBy
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QSortBy> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByExitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByExitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByParkingRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingRecordId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByParkingRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingRecordId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByParkingSlotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByParkingSlotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrand', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrand', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.desc);
    });
  }
}

extension ParkingRecordModelQuerySortThenBy
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QSortThenBy> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByEntryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByExitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitDate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByExitDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitDate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByParkingRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingRecordId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByParkingRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingRecordId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByParkingSlotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByParkingSlotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrand', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrand', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleModel', Sort.desc);
    });
  }
}

extension ParkingRecordModelQueryWhereDistinct
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByEntryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryDate');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByExitDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exitDate');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByParkingRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingRecordId');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByParkingSlotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSlotNumber');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByVehicleBrand({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleBrand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByVehicleLicensePlate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleLicensePlate',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByVehicleModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleModel', caseSensitive: caseSensitive);
    });
  }
}

extension ParkingRecordModelQueryProperty
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QQueryProperty> {
  QueryBuilder<ParkingRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ParkingRecordModel, DateTime, QQueryOperations>
      entryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryDate');
    });
  }

  QueryBuilder<ParkingRecordModel, DateTime?, QQueryOperations>
      exitDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exitDate');
    });
  }

  QueryBuilder<ParkingRecordModel, int, QQueryOperations>
      parkingRecordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingRecordId');
    });
  }

  QueryBuilder<ParkingRecordModel, int, QQueryOperations>
      parkingSlotNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSlotNumber');
    });
  }

  QueryBuilder<ParkingRecordModel, String, QQueryOperations>
      vehicleBrandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleBrand');
    });
  }

  QueryBuilder<ParkingRecordModel, int, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }

  QueryBuilder<ParkingRecordModel, String, QQueryOperations>
      vehicleLicensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleLicensePlate');
    });
  }

  QueryBuilder<ParkingRecordModel, String, QQueryOperations>
      vehicleModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleModel');
    });
  }
}
