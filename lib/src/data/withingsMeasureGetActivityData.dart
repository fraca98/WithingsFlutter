import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetActivityData] is a class that provides daily aggregated activity data of a user
class WithingsMeasureGetActivityData implements WithingsData {
  /// Response status
  int? status;

  /// Array of objects (Activities)
  List<Activities>? activities;

  /// To know if there is more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  WithingsMeasureGetActivityData(
      {this.status, this.activities, this.more, this.offset});

  WithingsMeasureGetActivityData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['status'] == 0 && json['body'] != null) {
      if (json['body']['activities'].isNotEmpty) {
        activities = <Activities>[];
        json['body']['activities'].forEach((v) {
          activities?.add(Activities.fromJson(v));
        });
      }
      more = json['body']['more'];
      offset = json['body']['offset'];
    }
  }

  @override
  String toString() {
    return (StringBuffer('WithingsMeasureGetActivityData(')
          ..write('status: $status, ')
          ..write('activities: $activities, ')
          ..write('more: $more, ')
          ..write('offset: $offset, ')
          ..write(')'))
        .toString();
  }
}

class Activities {
  /// Date of the aggregated data
  String? date;

  /// Number of steps. (Use 'dataFields' to request this data)
  int? steps;

  /// Distance travelled (in meters). (Use 'dataFields' to request this data)
  num? distance;

  /// Number of floors climbed. (Use 'dataFields' to request this data)
  num? elevation;

  /// Duration of soft activities (in seconds). (Use 'dataFields' to request this data)
  int? soft;

  /// Duration of moderate activities (in seconds). (Use 'dataFields' to request this data)
  int? moderate;

  /// Duration of intense activities (in seconds). (Use 'dataFields' to request this data)
  int? intense;

  /// Sum of intense and moderate activity durations (in seconds). (Use 'dataFields' to request this data)
  int? active;

  /// Active calories burned (in Kcal). Calculated by mixing fine granularity calories estimation,
  /// workouts estimated calories and calories manually set by the user. (Use 'dataFields' to request this data)
  num? calories;

  /// Total calories burned (in Kcal). Obtained by adding active calories and passive calories
  num? totalcalories;

  /// Average heart rate. (Use 'dataFields' to request this data)
  int? hrAverage;

  /// Minimal heart rate. (Use 'dataFields' to request this data)
  int? hrMin;

  /// Maximal heart rate. (Use 'dataFields' to request this data)
  int? hrMax;

  /// Duration in seconds when heart rate was in a light zone. (Use 'dataFields' to request this data)
  int? hrZone0;

  /// Duration in seconds when heart rate was in a moderate zone. (Use 'dataFields' to request this data)
  int? hrZone1;

  /// Duration in seconds when heart rate was in a intense zone. (Use 'dataFields' to request this data)
  int? hrZone2;

  /// Duration in seconds when heart rate was in a maximal zone. (Use 'dataFields' to request this data)
  int? hrZone3;

  Activities(
      {this.date,
      this.steps,
      this.distance,
      this.elevation,
      this.soft,
      this.moderate,
      this.intense,
      this.active,
      this.calories,
      this.totalcalories,
      this.hrAverage,
      this.hrMin,
      this.hrMax,
      this.hrZone0,
      this.hrZone1,
      this.hrZone2,
      this.hrZone3});

  Activities.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    steps = json['steps'];
    distance = json['distance'];
    elevation = json['elevation'];
    soft = json['soft'];
    moderate = json['moderate'];
    intense = json['intense'];
    active = json['active'];
    calories = json['calories'];
    totalcalories = json['totalcalories'];
    hrAverage = json['hr_average'];
    hrMin = json['hr_min'];
    hrMax = json['hr_max'];
    hrZone0 = json['hr_zone_0'];
    hrZone1 = json['hr_zone_1'];
    hrZone2 = json['hr_zone_2'];
    hrZone3 = json['hr_zone_3'];
  }

  @override
  String toString() {
    return (StringBuffer('Activities(')
          ..write('date: $date, ')
          ..write('steps: $steps, ')
          ..write('distance: $distance, ')
          ..write('elevation: $elevation, ')
          ..write('soft: $soft, ')
          ..write('moderate: $moderate, ')
          ..write('intense: $intense, ')
          ..write('active: $active, ')
          ..write('calories: $calories, ')
          ..write('totalcalories: $totalcalories, ')
          ..write('hr_average: $hrAverage, ')
          ..write('hr_min: $hrMin, ')
          ..write('hr_max: $hrMax, ')
          ..write('hr_zone_0: $hrZone0, ')
          ..write('hr_zone_1: $hrZone1, ')
          ..write('hr_zone_2: $hrZone2, ')
          ..write('hr_zone_3: $hrZone3, ')
          ..write(')'))
        .toString();
  }
}
