// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamedata.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameDataCollection on Isar {
  IsarCollection<GameData> get gameDatas => this.collection();
}

const GameDataSchema = CollectionSchema(
  name: r'GameData',
  id: -6579857273911918101,
  properties: {
    r'canContinue': PropertySchema(
      id: 0,
      name: r'canContinue',
      type: IsarType.bool,
    ),
    r'currentScore': PropertySchema(
      id: 1,
      name: r'currentScore',
      type: IsarType.long,
    ),
    r'isIntroShown': PropertySchema(
      id: 2,
      name: r'isIntroShown',
      type: IsarType.bool,
    ),
    r'maxScore': PropertySchema(
      id: 3,
      name: r'maxScore',
      type: IsarType.long,
    )
  },
  estimateSize: _gameDataEstimateSize,
  serialize: _gameDataSerialize,
  deserialize: _gameDataDeserialize,
  deserializeProp: _gameDataDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _gameDataGetId,
  getLinks: _gameDataGetLinks,
  attach: _gameDataAttach,
  version: '3.1.0+1',
);

int _gameDataEstimateSize(
  GameData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _gameDataSerialize(
  GameData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.canContinue);
  writer.writeLong(offsets[1], object.currentScore);
  writer.writeBool(offsets[2], object.isIntroShown);
  writer.writeLong(offsets[3], object.maxScore);
}

GameData _gameDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameData(
    canContinue: reader.readBool(offsets[0]),
    currentScore: reader.readLong(offsets[1]),
    isIntroShown: reader.readBool(offsets[2]),
    maxScore: reader.readLong(offsets[3]),
  );
  object.isarId = id;
  return object;
}

P _gameDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameDataGetId(GameData object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _gameDataGetLinks(GameData object) {
  return [];
}

void _gameDataAttach(IsarCollection<dynamic> col, Id id, GameData object) {
  object.isarId = id;
}

extension GameDataQueryWhereSort on QueryBuilder<GameData, GameData, QWhere> {
  QueryBuilder<GameData, GameData, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GameDataQueryWhere on QueryBuilder<GameData, GameData, QWhereClause> {
  QueryBuilder<GameData, GameData, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GameData, GameData, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GameData, GameData, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameData, GameData, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameDataQueryFilter
    on QueryBuilder<GameData, GameData, QFilterCondition> {
  QueryBuilder<GameData, GameData, QAfterFilterCondition> canContinueEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canContinue',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> currentScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition>
      currentScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> currentScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> currentScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> isIntroShownEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isIntroShown',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> maxScoreEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> maxScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> maxScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GameData, GameData, QAfterFilterCondition> maxScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameDataQueryObject
    on QueryBuilder<GameData, GameData, QFilterCondition> {}

extension GameDataQueryLinks
    on QueryBuilder<GameData, GameData, QFilterCondition> {}

extension GameDataQuerySortBy on QueryBuilder<GameData, GameData, QSortBy> {
  QueryBuilder<GameData, GameData, QAfterSortBy> sortByCanContinue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canContinue', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> sortByCanContinueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canContinue', Sort.desc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> sortByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> sortByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> sortByIsIntroShown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntroShown', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> sortByIsIntroShownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntroShown', Sort.desc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> sortByMaxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxScore', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> sortByMaxScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxScore', Sort.desc);
    });
  }
}

extension GameDataQuerySortThenBy
    on QueryBuilder<GameData, GameData, QSortThenBy> {
  QueryBuilder<GameData, GameData, QAfterSortBy> thenByCanContinue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canContinue', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByCanContinueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canContinue', Sort.desc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByCurrentScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentScore', Sort.desc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByIsIntroShown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntroShown', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByIsIntroShownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIntroShown', Sort.desc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByMaxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxScore', Sort.asc);
    });
  }

  QueryBuilder<GameData, GameData, QAfterSortBy> thenByMaxScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxScore', Sort.desc);
    });
  }
}

extension GameDataQueryWhereDistinct
    on QueryBuilder<GameData, GameData, QDistinct> {
  QueryBuilder<GameData, GameData, QDistinct> distinctByCanContinue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canContinue');
    });
  }

  QueryBuilder<GameData, GameData, QDistinct> distinctByCurrentScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentScore');
    });
  }

  QueryBuilder<GameData, GameData, QDistinct> distinctByIsIntroShown() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isIntroShown');
    });
  }

  QueryBuilder<GameData, GameData, QDistinct> distinctByMaxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxScore');
    });
  }
}

extension GameDataQueryProperty
    on QueryBuilder<GameData, GameData, QQueryProperty> {
  QueryBuilder<GameData, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GameData, bool, QQueryOperations> canContinueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canContinue');
    });
  }

  QueryBuilder<GameData, int, QQueryOperations> currentScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentScore');
    });
  }

  QueryBuilder<GameData, bool, QQueryOperations> isIntroShownProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isIntroShown');
    });
  }

  QueryBuilder<GameData, int, QQueryOperations> maxScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxScore');
    });
  }
}
