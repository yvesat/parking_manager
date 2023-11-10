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
    r'isOccupied': PropertySchema(
      id: 0,
      name: r'isOccupied',
      type: IsarType.bool,
    ),
    r'occupingVehicleId': PropertySchema(
      id: 1,
      name: r'occupingVehicleId',
      type: IsarType.long,
    ),
    r'slotId': PropertySchema(
      id: 2,
      name: r'slotId',
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
  writer.writeBool(offsets[0], object.isOccupied);
  writer.writeLong(offsets[1], object.occupingVehicleId);
  writer.writeLong(offsets[2], object.slotId);
}

ParkingSlotModel _parkingSlotModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingSlotModel(
    isOccupied: reader.readBool(offsets[0]),
    slotId: reader.readLong(offsets[2]),
  );
  object.id = id;
  object.occupingVehicleId = reader.readLongOrNull(offsets[1]);
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
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
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
      isOccupiedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOccupied',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupingVehicleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'occupingVehicleId',
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupingVehicleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'occupingVehicleId',
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupingVehicleIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'occupingVehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupingVehicleIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'occupingVehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupingVehicleIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'occupingVehicleId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      occupingVehicleIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'occupingVehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      slotIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slotId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      slotIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slotId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      slotIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slotId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterFilterCondition>
      slotIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slotId',
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
      sortByIsOccupied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOccupied', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByIsOccupiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOccupied', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByOccupingVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupingVehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortByOccupingVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupingVehicleId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortBySlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      sortBySlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.desc);
    });
  }
}

extension ParkingSlotModelQuerySortThenBy
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QSortThenBy> {
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
      thenByIsOccupied() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOccupied', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByIsOccupiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOccupied', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByOccupingVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupingVehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenByOccupingVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'occupingVehicleId', Sort.desc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenBySlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.asc);
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QAfterSortBy>
      thenBySlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.desc);
    });
  }
}

extension ParkingSlotModelQueryWhereDistinct
    on QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct> {
  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct>
      distinctByIsOccupied() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOccupied');
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct>
      distinctByOccupingVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'occupingVehicleId');
    });
  }

  QueryBuilder<ParkingSlotModel, ParkingSlotModel, QDistinct>
      distinctBySlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slotId');
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

  QueryBuilder<ParkingSlotModel, bool, QQueryOperations> isOccupiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOccupied');
    });
  }

  QueryBuilder<ParkingSlotModel, int?, QQueryOperations>
      occupingVehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'occupingVehicleId');
    });
  }

  QueryBuilder<ParkingSlotModel, int, QQueryOperations> slotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slotId');
    });
  }
}
