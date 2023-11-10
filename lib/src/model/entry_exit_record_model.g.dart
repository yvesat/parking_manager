// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_exit_record_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEntryExitRecordModelCollection on Isar {
  IsarCollection<EntryExitRecordModel> get entryExitRecordModels =>
      this.collection();
}

const EntryExitRecordModelSchema = CollectionSchema(
  name: r'EntryExitRecordModel',
  id: 2129334351151751646,
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
    r'parkingSlotId': PropertySchema(
      id: 2,
      name: r'parkingSlotId',
      type: IsarType.long,
    ),
    r'vehicleBrandModel': PropertySchema(
      id: 3,
      name: r'vehicleBrandModel',
      type: IsarType.string,
    ),
    r'vehicleId': PropertySchema(
      id: 4,
      name: r'vehicleId',
      type: IsarType.long,
    ),
    r'vehicleLicenePlate': PropertySchema(
      id: 5,
      name: r'vehicleLicenePlate',
      type: IsarType.string,
    )
  },
  estimateSize: _entryExitRecordModelEstimateSize,
  serialize: _entryExitRecordModelSerialize,
  deserialize: _entryExitRecordModelDeserialize,
  deserializeProp: _entryExitRecordModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _entryExitRecordModelGetId,
  getLinks: _entryExitRecordModelGetLinks,
  attach: _entryExitRecordModelAttach,
  version: '3.1.0+1',
);

int _entryExitRecordModelEstimateSize(
  EntryExitRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.vehicleBrandModel.length * 3;
  bytesCount += 3 + object.vehicleLicenePlate.length * 3;
  return bytesCount;
}

void _entryExitRecordModelSerialize(
  EntryExitRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.entryTime);
  writer.writeDateTime(offsets[1], object.exitTime);
  writer.writeLong(offsets[2], object.parkingSlotId);
  writer.writeString(offsets[3], object.vehicleBrandModel);
  writer.writeLong(offsets[4], object.vehicleId);
  writer.writeString(offsets[5], object.vehicleLicenePlate);
}

EntryExitRecordModel _entryExitRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EntryExitRecordModel(
    entryTime: reader.readDateTime(offsets[0]),
    exitTime: reader.readDateTimeOrNull(offsets[1]),
    parkingSlotId: reader.readLong(offsets[2]),
    vehicleBrandModel: reader.readString(offsets[3]),
    vehicleId: reader.readLong(offsets[4]),
    vehicleLicenePlate: reader.readString(offsets[5]),
  );
  object.id = id;
  return object;
}

P _entryExitRecordModelDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _entryExitRecordModelGetId(EntryExitRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _entryExitRecordModelGetLinks(
    EntryExitRecordModel object) {
  return [];
}

void _entryExitRecordModelAttach(
    IsarCollection<dynamic> col, Id id, EntryExitRecordModel object) {
  object.id = id;
}

extension EntryExitRecordModelQueryWhereSort
    on QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QWhere> {
  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EntryExitRecordModelQueryWhere
    on QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QWhereClause> {
  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterWhereClause>
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterWhereClause>
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

extension EntryExitRecordModelQueryFilter on QueryBuilder<EntryExitRecordModel,
    EntryExitRecordModel, QFilterCondition> {
  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> entryTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entryTime',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> entryTimeGreaterThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> entryTimeLessThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> entryTimeBetween(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> exitTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'exitTime',
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> exitTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'exitTime',
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> exitTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exitTime',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> exitTimeGreaterThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> exitTimeLessThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> exitTimeBetween(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> parkingSlotIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSlotId',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> parkingSlotIdGreaterThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> parkingSlotIdLessThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> parkingSlotIdBetween(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelEqualTo(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelGreaterThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelLessThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelBetween(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelStartsWith(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelEndsWith(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
          QAfterFilterCondition>
      vehicleBrandModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleBrandModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
          QAfterFilterCondition>
      vehicleBrandModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleBrandModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleBrandModel',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleBrandModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleBrandModel',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleIdGreaterThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleIdLessThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleIdBetween(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateEqualTo(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateGreaterThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateLessThan(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateBetween(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateStartsWith(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateEndsWith(
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

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
          QAfterFilterCondition>
      vehicleLicenePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleLicenePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
          QAfterFilterCondition>
      vehicleLicenePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleLicenePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleLicenePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel,
      QAfterFilterCondition> vehicleLicenePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleLicenePlate',
        value: '',
      ));
    });
  }
}

extension EntryExitRecordModelQueryObject on QueryBuilder<EntryExitRecordModel,
    EntryExitRecordModel, QFilterCondition> {}

extension EntryExitRecordModelQueryLinks on QueryBuilder<EntryExitRecordModel,
    EntryExitRecordModel, QFilterCondition> {}

extension EntryExitRecordModelQuerySortBy
    on QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QSortBy> {
  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByEntryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByEntryTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByExitTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByExitTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByParkingSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByParkingSlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByVehicleBrandModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByVehicleBrandModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByVehicleLicenePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      sortByVehicleLicenePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.desc);
    });
  }
}

extension EntryExitRecordModelQuerySortThenBy
    on QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QSortThenBy> {
  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByEntryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByEntryTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryTime', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByExitTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByExitTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exitTime', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByParkingSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByParkingSlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotId', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByVehicleBrandModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByVehicleBrandModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleBrandModel', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByVehicleLicenePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.asc);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QAfterSortBy>
      thenByVehicleLicenePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleLicenePlate', Sort.desc);
    });
  }
}

extension EntryExitRecordModelQueryWhereDistinct
    on QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QDistinct> {
  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QDistinct>
      distinctByEntryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryTime');
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QDistinct>
      distinctByExitTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exitTime');
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QDistinct>
      distinctByParkingSlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSlotId');
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QDistinct>
      distinctByVehicleBrandModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleBrandModel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QDistinct>
      distinctByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId');
    });
  }

  QueryBuilder<EntryExitRecordModel, EntryExitRecordModel, QDistinct>
      distinctByVehicleLicenePlate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleLicenePlate',
          caseSensitive: caseSensitive);
    });
  }
}

extension EntryExitRecordModelQueryProperty on QueryBuilder<
    EntryExitRecordModel, EntryExitRecordModel, QQueryProperty> {
  QueryBuilder<EntryExitRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EntryExitRecordModel, DateTime, QQueryOperations>
      entryTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryTime');
    });
  }

  QueryBuilder<EntryExitRecordModel, DateTime?, QQueryOperations>
      exitTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exitTime');
    });
  }

  QueryBuilder<EntryExitRecordModel, int, QQueryOperations>
      parkingSlotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSlotId');
    });
  }

  QueryBuilder<EntryExitRecordModel, String, QQueryOperations>
      vehicleBrandModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleBrandModel');
    });
  }

  QueryBuilder<EntryExitRecordModel, int, QQueryOperations>
      vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }

  QueryBuilder<EntryExitRecordModel, String, QQueryOperations>
      vehicleLicenePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleLicenePlate');
    });
  }
}
