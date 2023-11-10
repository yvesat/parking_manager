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
    r'entryTime': PropertySchema(
      id: 0,
      name: r'entryTime',
      type: IsarType.dateTime,
    ),
    r'exitTime': PropertySchema(
      id: 1,
      name: r'exitTime',
      type: IsarType.dateTime,
    ),
    r'parkingRecordId': PropertySchema(
      id: 2,
      name: r'parkingRecordId',
      type: IsarType.long,
    ),
    r'parkingSlotId': PropertySchema(
      id: 3,
      name: r'parkingSlotId',
      type: IsarType.long,
    ),
    r'vehicleBrandModel': PropertySchema(
      id: 4,
      name: r'vehicleBrandModel',
      type: IsarType.string,
    ),
    r'vehicleId': PropertySchema(
      id: 5,
      name: r'vehicleId',
      type: IsarType.long,
    ),
    r'vehicleLicenePlate': PropertySchema(
      id: 6,
      name: r'vehicleLicenePlate',
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
  bytesCount += 3 + object.vehicleBrandModel.length * 3;
  bytesCount += 3 + object.vehicleLicenePlate.length * 3;
  return bytesCount;
}

void _parkingRecordModelSerialize(
  ParkingRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.entryTime);
  writer.writeDateTime(offsets[1], object.exitTime);
  writer.writeLong(offsets[2], object.parkingRecordId);
  writer.writeLong(offsets[3], object.parkingSlotId);
  writer.writeString(offsets[4], object.vehicleBrandModel);
  writer.writeLong(offsets[5], object.vehicleId);
  writer.writeString(offsets[6], object.vehicleLicenePlate);
}

ParkingRecordModel _parkingRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingRecordModel(
    entryTime: reader.readDateTime(offsets[0]),
    exitTime: reader.readDateTimeOrNull(offsets[1]),
    parkingRecordId: reader.readLong(offsets[2]),
    parkingSlotId: reader.readLong(offsets[3]),
    vehicleBrandModel: reader.readString(offsets[4]),
    vehicleId: reader.readLong(offsets[5]),
    vehicleLicenePlate: reader.readString(offsets[6]),
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
      entryTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      entryTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entryTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      entryTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entryTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      entryTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entryTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exitTime',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exitTime',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exitTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exitTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exitTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      exitTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exitTime',
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
      parkingSlotIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSlotId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingSlotIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingSlotId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingSlotIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingSlotId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      parkingSlotIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingSlotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleBrandModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleBrandModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleBrandModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleBrandModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleBrandModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleBrandModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleBrandModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleBrandModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleBrandModel',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleBrandModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleBrandModel',
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
      vehicleLicenePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleLicenePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleLicenePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleLicenePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleLicenePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleLicenePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleLicenePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleLicenePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleLicenePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleLicenePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterFilterCondition>
      vehicleLicenePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleLicenePlate',
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
      sortByEntryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByEntryTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByExitTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByExitTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.desc);
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
      sortByParkingSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByParkingSlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleBrandModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleBrandModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.desc);
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
      sortByVehicleLicenePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      sortByVehicleLicenePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.desc);
    });
  }
}

extension ParkingRecordModelQuerySortThenBy
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QSortThenBy> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByEntryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByEntryTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByExitTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByExitTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.desc);
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
      thenByParkingSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByParkingSlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleBrandModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleBrandModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.desc);
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
      thenByVehicleLicenePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QAfterSortBy>
      thenByVehicleLicenePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.desc);
    });
  }
}

extension ParkingRecordModelQueryWhereDistinct
    on QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct> {
  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByEntryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryTime');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByExitTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exitTime');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByParkingRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingRecordId');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByParkingSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSlotId');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByVehicleBrandModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleBrandModel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId');
    });
  }

  QueryBuilder<ParkingRecordModel, ParkingRecordModel, QDistinct>
      distinctByVehicleLicenePlate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleLicenePlate',
          caseSensitive: caseSensitive);
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
      entryTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryTime');
    });
  }

  QueryBuilder<ParkingRecordModel, DateTime?, QQueryOperations>
      exitTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exitTime');
    });
  }

  QueryBuilder<ParkingRecordModel, int, QQueryOperations>
      parkingRecordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingRecordId');
    });
  }

  QueryBuilder<ParkingRecordModel, int, QQueryOperations>
      parkingSlotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSlotId');
    });
  }

  QueryBuilder<ParkingRecordModel, String, QQueryOperations>
      vehicleBrandModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleBrandModel');
    });
  }

  QueryBuilder<ParkingRecordModel, int, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }

  QueryBuilder<ParkingRecordModel, String, QQueryOperations>
      vehicleLicenePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleLicenePlate');
    });
  }
}
