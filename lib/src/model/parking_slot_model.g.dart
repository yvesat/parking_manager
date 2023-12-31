// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_slot_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingSlotModelCollection on Isar {
  IsarCollection<ParkingSlotModel> get parkingSlotModels => this.collection();
}

const ParkingSlotModelSchema = CollectionSchema(
  name: r'ParkingSlotModel',
  id: 4956515367755463656,
  properties: {
    r'available': PropertySchema(
      id: 0,
      name: r'available',
      type: IsarType.bool,
    ),
    r'currentParkingRecordId': PropertySchema(
      id: 1,
      name: r'currentParkingRecordId',
      type: IsarType.long,
    ),
    r'occupyingVehicleId': PropertySchema(
      id: 2,
      name: r'occupyingVehicleId',
      type: IsarType.long,
    ),
    r'parkingSlotNumber': PropertySchema(
      id: 3,
      name: r'parkingSlotNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _parkingSlotModelEstimateSize,
  serialize: _parkingSlotModelSerialize,
  deserialize: _parkingSlotModelDeserialize,
  deserializeProp: _parkingSlotModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _parkingSlotModelGetId,
  getLinks: _parkingSlotModelGetLinks,
  attach: _parkingSlotModelAttach,
  version: '3.1.0+1',
);

int _parkingSlotModelEstimateSize(
  ParkingSlotModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _parkingSlotModelSerialize(
  ParkingSlotModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.available);
  writer.writeLong(offsets[1], object.currentParkingRecordId);
  writer.writeLong(offsets[2], object.occupyingVehicleId);
  writer.writeLong(offsets[3], object.parkingSlotNumber);
}

ParkingSlotModel _parkingSlotModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingSlotModel(
    available: reader.readBoolOrNull(offsets[0]) ?? true,
    currentParkingRecordId: reader.readLongOrNull(offsets[1]),
    occupyingVehicleId: reader.readLongOrNull(offsets[2]),
    parkingSlotNumber: reader.readLong(offsets[3]),
  );
  object.id = id;
  return object;
}

P _parkingSlotModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingSlotModelGetId(ParkingSlotModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _parkingSlotModelGetLinks(ParkingSlotModel object) {
  return [];
}

void _parkingSlotModelAttach(
    IsarCollection<dynamic> col, Id id, ParkingSlotModel object) {
  object.id = id;
}

extension ParkingSlotModelQueryWhereSort
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QWhere> {
  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingSlotModelQueryWhere
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QWhereClause> {
  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterWhereClause>
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

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterWhereClause> idBetween(
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

extension ParkingSlotModelQueryFilter
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QFilterCondition> {
  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      availableEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'available',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      currentParkingRecordIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentParkingRecordId',
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      currentParkingRecordIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentParkingRecordId',
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      currentParkingRecordIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentParkingRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      currentParkingRecordIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentParkingRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      currentParkingRecordIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentParkingRecordId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      currentParkingRecordIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentParkingRecordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
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

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
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

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
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

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupyingVehicleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'occupyingVehicleId',
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupyingVehicleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'occupyingVehicleId',
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupyingVehicleIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occupyingVehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupyingVehicleIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'occupyingVehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupyingVehicleIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'occupyingVehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupyingVehicleIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'occupyingVehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      parkingSlotNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSlotNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
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

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
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

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
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
}

extension ParkingSlotModelQueryObject
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QFilterCondition> {}

extension ParkingSlotModelQueryLinks
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QFilterCondition> {}

extension ParkingSlotModelQuerySortBy
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QSortBy> {
  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByCurrentParkingRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentParkingRecordId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByCurrentParkingRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentParkingRecordId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByOccupyingVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupyingVehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByOccupyingVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupyingVehicleId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByParkingSlotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByParkingSlotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.desc);
    });
  }
}

extension ParkingSlotModelQuerySortThenBy
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QSortThenBy> {
  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByCurrentParkingRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentParkingRecordId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByCurrentParkingRecordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentParkingRecordId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByOccupyingVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupyingVehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByOccupyingVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupyingVehicleId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByParkingSlotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByParkingSlotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSlotNumber', Sort.desc);
    });
  }
}

extension ParkingSlotModelQueryWhereDistinct
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct> {
  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct>
      distinctByAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'available');
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct>
      distinctByCurrentParkingRecordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentParkingRecordId');
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct>
      distinctByOccupyingVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occupyingVehicleId');
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct>
      distinctByParkingSlotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSlotNumber');
    });
  }
}

extension ParkingSlotModelQueryProperty
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QQueryProperty> {
  QueryBuilder<ParkingSlotModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ParkingSlotModel, bool, QQueryOperations> availableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'available');
    });
  }

  QueryBuilder<ParkingSlotModel, int?, QQueryOperations>
      currentParkingRecordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentParkingRecordId');
    });
  }

  QueryBuilder<ParkingSlotModel, int?, QQueryOperations>
      occupyingVehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occupyingVehicleId');
    });
  }

  QueryBuilder<ParkingSlotModel, int, QQueryOperations>
      parkingSlotNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSlotNumber');
    });
  }
}
