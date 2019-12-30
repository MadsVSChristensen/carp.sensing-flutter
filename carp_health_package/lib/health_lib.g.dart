// GENERATED CODE - DO NOT MODIFY BY HAND

part of health_lib;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthMeasure _$HealthMeasureFromJson(Map<String, dynamic> json) {
  return HealthMeasure(
    json['type'] == null
        ? null
        : MeasureType.fromJson(json['type'] as Map<String, dynamic>),
    healthDataTypes: (json['health_data_types'] as List)
        ?.map((e) => _$enumDecodeNullable(_$HealthDataTypeEnumMap, e))
        ?.toList(),
    interval: json['interval'] == null
        ? null
        : Duration(microseconds: json['interval'] as int),
    startTime: json['start_time'] == null
        ? null
        : DateTime.parse(json['start_time'] as String),
  )
    ..c__ = json['c__'] as String
    ..name = json['name'] as String
    ..enabled = json['enabled'] as bool
    ..configuration = (json['configuration'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$HealthMeasureToJson(HealthMeasure instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('c__', instance.c__);
  writeNotNull('type', instance.type);
  writeNotNull('name', instance.name);
  writeNotNull('enabled', instance.enabled);
  writeNotNull('configuration', instance.configuration);
  writeNotNull(
      'health_data_types',
      instance.healthDataTypes
          ?.map((e) => _$HealthDataTypeEnumMap[e])
          ?.toList());
  writeNotNull('interval', instance.interval?.inMicroseconds);
  writeNotNull('start_time', instance.startTime?.toIso8601String());
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$HealthDataTypeEnumMap = {
  HealthDataType.BODY_FAT_PERCENTAGE: 'BODY_FAT_PERCENTAGE',
  HealthDataType.HEIGHT: 'HEIGHT',
  HealthDataType.WEIGHT: 'WEIGHT',
  HealthDataType.BODY_MASS_INDEX: 'BODY_MASS_INDEX',
  HealthDataType.WAIST_CIRCUMFERENCE: 'WAIST_CIRCUMFERENCE',
  HealthDataType.STEPS: 'STEPS',
  HealthDataType.BASAL_ENERGY_BURNED: 'BASAL_ENERGY_BURNED',
  HealthDataType.ACTIVE_ENERGY_BURNED: 'ACTIVE_ENERGY_BURNED',
  HealthDataType.HEART_RATE: 'HEART_RATE',
  HealthDataType.BODY_TEMPERATURE: 'BODY_TEMPERATURE',
  HealthDataType.BLOOD_PRESSURE_SYSTOLIC: 'BLOOD_PRESSURE_SYSTOLIC',
  HealthDataType.BLOOD_PRESSURE_DIASTOLIC: 'BLOOD_PRESSURE_DIASTOLIC',
  HealthDataType.RESTING_HEART_RATE: 'RESTING_HEART_RATE',
  HealthDataType.WALKING_HEART_RATE: 'WALKING_HEART_RATE',
  HealthDataType.BLOOD_OXYGEN: 'BLOOD_OXYGEN',
  HealthDataType.BLOOD_GLUCOSE: 'BLOOD_GLUCOSE',
  HealthDataType.ELECTRODERMAL_ACTIVITY: 'ELECTRODERMAL_ACTIVITY',
  HealthDataType.HIGH_HEART_RATE_EVENT: 'HIGH_HEART_RATE_EVENT',
  HealthDataType.LOW_HEART_RATE_EVENT: 'LOW_HEART_RATE_EVENT',
  HealthDataType.IRREGULAR_HEART_RATE_EVENT: 'IRREGULAR_HEART_RATE_EVENT',
};

HealthDatum _$HealthDatumFromJson(Map<String, dynamic> json) {
  return HealthDatum()
    ..id = json['id'] as String
    ..timestamp = json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String)
    ..value = json['value'] as num
    ..unit = json['unit'] as String
    ..dateFrom = json['date_from'] as int
    ..dateTo = json['date_to'] as int
    ..dataType = json['data_type'] as String
    ..platform = json['platform'] as String;
}

Map<String, dynamic> _$HealthDatumToJson(HealthDatum instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('value', instance.value);
  writeNotNull('unit', instance.unit);
  writeNotNull('date_from', instance.dateFrom);
  writeNotNull('date_to', instance.dateTo);
  writeNotNull('data_type', instance.dataType);
  writeNotNull('platform', instance.platform);
  return val;
}
