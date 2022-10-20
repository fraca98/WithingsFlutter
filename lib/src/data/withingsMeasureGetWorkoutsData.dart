import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetWorkoutsData] is a class that returns workout summaries, which are an aggregation all data that was captured during that workout
class WithingsMeasureGetWorkoutsData implements WithingsData {
  /// Response status
  int? status;

  /// List of objects (SeriesMeasureGetworkouts)
  List<SeriesMeasureGetworkouts>? series;

  /// To know if there is more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  /// Default [WithingsMeasureGetWorkoutsData] constructor
  WithingsMeasureGetWorkoutsData(
      {this.status, this.series, this.more, this.offset});

  WithingsMeasureGetWorkoutsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['status'] == 0 && json['body'] != null) {
      if (json['body']['series'].isNotEmpty) {
        series = <SeriesMeasureGetworkouts>[];
        json['body']['series'].forEach((v) {
          series?.add(SeriesMeasureGetworkouts.fromJson(v));
        });
      }
      more = json['body']['more'];
      offset = json['body']['offset'];
    }
  }

  @override
  String toString() {
    return (StringBuffer('WithingsMeasureGetWorkoutsData(')
          ..write('status: $status, ')
          ..write('series: $series, ')
          ..write('more: $more, ')
          ..write('offset: $offset, ')
          ..write(')'))
        .toString();
  }
}

class SeriesMeasureGetworkouts {
  /// Category of workout
  int? category;

  /// The starting datetime for workouts data
  int? startdate;

  /// The ending datetime for workouts data
  int? enddate;

  /// Date at which the measure was taken or entered
  String? date;

  /// Object (Details of workout)
  DataMeasureGetworkouts? data;

  SeriesMeasureGetworkouts(
      {this.category, this.startdate, this.enddate, this.date, this.data});

  SeriesMeasureGetworkouts.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    date = json['date'];
    data = json['data'].isNotEmpty
        ? DataMeasureGetworkouts.fromJson(json['data'])
        : null;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesMeasureGetworkouts(')
          ..write('category: $category, ')
          ..write('startdate: $startdate, ')
          ..write('enddate: $enddate, ')
          ..write('date: $date, ')
          ..write('data: $data, ')
          ..write(')'))
        .toString();
  }
}

class DataMeasureGetworkouts {
  /// Total pause time in seconds detected by Withings device (swim only)
  int? algoPauseDuration;

  /// Active calories burned (in Kcal). (Use 'data_fields' to request this data)
  int? calories;

  /// Distance travelled (in meters). (Use 'data_fields' to request this data)
  int? distance;

  /// Number of floors climbed. (Use 'data_fields' to request this data)
  int? elevation;

  /// Average heart rate. (Use 'data_fields' to request this data)
  int? hrAverage;

  /// Maximal heart rate. (Use 'data_fields' to request this data)
  int? hrMax;

  /// Minimal heart rate. (Use 'dataFields' to request this data)
  int? hrMin;

  /// Duration in seconds when heart rate was in a light zone. (Use 'dataFields' to request this data)
  int? hrZone0;

  /// Duration in seconds when heart rate was in a moderate zone. (Use 'dataFields' to request this data)
  int? hrZone1;

  /// Duration in seconds when heart rate was in a intense zone. (Use 'dataFields' to request this data)
  int? hrZone2;

  /// Duration in seconds when heart rate was in a maximal zone. (Use 'dataFields' to request this data)
  int? hrZone3;

  /// Intensity of the workout, from 0 to 100, as inputed by the user.
  /// If the user didn't manually give the intensity of his workout, the value will be 0.
  int? intensity;

  /// Active calories burned manually entered by user (in Kcal). (Use 'dataFields' to request this data)
  int? manualCalories;

  /// Distance travelled manually entered by user (in meters). (Use 'dataFields' to request this data)
  int? manualDistance;

  /// Total pause time in second filled by user
  int? pauseDuration;

  /// Number of pool laps. (Use 'dataFields' to request this data)
  int? poolLaps;

  /// Length of the pool. (Use 'dataFields' to request this data.)
  int? poolLength;

  /// Average percent of SpO2 percent value during a workout
  int? spo2Average;

  /// Number of steps. (Use 'dataFields' to request this data)
  int? steps;

  /// Number of strokes. (Use 'dataFields' to request this data)
  int? strokes;

  DataMeasureGetworkouts(
      {this.algoPauseDuration,
      this.calories,
      this.distance,
      this.elevation,
      this.hrAverage,
      this.hrMax,
      this.hrMin,
      this.hrZone0,
      this.hrZone1,
      this.hrZone2,
      this.hrZone3,
      this.intensity,
      this.manualCalories,
      this.manualDistance,
      this.pauseDuration,
      this.poolLaps,
      this.poolLength,
      this.spo2Average,
      this.steps,
      this.strokes});

  DataMeasureGetworkouts.fromJson(Map<String, dynamic> json) {
    algoPauseDuration = json['algo_pause_duration'];
    calories = json['calories'];
    distance = json['distance'];
    elevation = json['elevation'];
    hrAverage = json['hr_average'];
    hrMax = json['hr_max'];
    hrMin = json['hr_min'];
    hrZone0 = json['hr_zone_0'];
    hrZone1 = json['hr_zone_1'];
    hrZone2 = json['hr_zone_2'];
    hrZone3 = json['hr_zone_3'];
    intensity = json['intensity'];
    manualCalories = json['manual_calories'];
    manualDistance = json['manual_distance'];
    pauseDuration = json['pause_duration'];
    poolLaps = json['pool_laps'];
    poolLength = json['pool_length'];
    spo2Average = json['spo2_average'];
    steps = json['steps'];
    strokes = json['strokes'];
  }

  @override
  String toString() {
    return (StringBuffer('SeriesMeasureGetworkouts(')
          ..write('algo_pause_duration: $algoPauseDuration, ')
          ..write('calories: $calories, ')
          ..write('distance: $distance, ')
          ..write('elevation: $elevation, ')
          ..write('hr_average: $hrAverage, ')
          ..write('hr_max: $hrMax, ')
          ..write('hr_min: $hrMin, ')
          ..write('hr_zone_0: $hrZone1, ')
          ..write('hr_zone_1: $hrZone2, ')
          ..write('hr_zone_2: $hrZone2, ')
          ..write('hr_zone_3: $hrZone3, ')
          ..write('intensity: $intensity, ')
          ..write('manual_calories: $manualCalories, ')
          ..write('manual_distance: $manualDistance, ')
          ..write('pause_duration: $pauseDuration, ')
          ..write('pool_laps: $poolLaps, ')
          ..write('pool_length: $poolLength, ')
          ..write('spo2_average: $spo2Average, ')
          ..write('steps: $steps, ')
          ..write('strokes: $strokes, ')
          ..write(')'))
        .toString();
  }
}
