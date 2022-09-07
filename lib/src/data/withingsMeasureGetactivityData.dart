import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetactivityData] is a class that provides daily aggregated activity data of a user
class WithingsMeasureGetactivityData implements WithingsData {
  /// Response status
  int? status;

  /// Response body
  BodyMeasureGetactivity? body;

  WithingsMeasureGetactivityData({this.status, this.body});

  WithingsMeasureGetactivityData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null
        ? BodyMeasureGetactivity.fromJson(json['body'])
        : null;
  }

  @override
  Map<String, dynamic> toJson<T extends WithingsData>() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return (StringBuffer('WithingsMeasureGetactivityData(')
          ..write('status: $status, ')
          ..write('body: $body, ')
          ..write(')'))
        .toString();
  }
}

class BodyMeasureGetactivity {
  /// Array of objects
  List<Activities>? activities;

  /// To know if there is more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  BodyMeasureGetactivity({this.activities, this.more, this.offset});

  BodyMeasureGetactivity.fromJson(Map<String, dynamic> json) {
    if (json['activities'].isNotEmpty) {
      activities = <Activities>[];
      json['activities'].forEach((v) {
        activities!.add(Activities.fromJson(v));
      });
    }
    more = json['more'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (activities != null) {
      data['activities'] = activities!.map((v) => v.toJson()).toList();
    }
    data['more'] = more;
    data['offset'] = offset;
    return data;
  }

  @override
  String toString() {
    return (StringBuffer('BodyMeasureGetactivity(')
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

  /// Timezone for the date
  String? timezone;

  /// ID of device that tracked the data
  String? deviceid;

  /// ID of device that tracked the data
  String? hashDeviceid;

  /// Specifies if data comes from Withings (device or mobile application tracker)
  /// or an external way (Value is 1 for Withings and 18 for external)
  int? brand;

  /// Is true if data was tracked by a Withings tracker (such as Pulse, Go and Watches)
  /// otherwise data was tracked by a mobile application or an external way
  bool? isTracker;

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
      this.timezone,
      this.deviceid,
      this.hashDeviceid,
      this.brand,
      this.isTracker,
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
    timezone = json['timezone'];
    deviceid = json['deviceid'];
    hashDeviceid = json['hash_deviceid'];
    brand = json['brand'];
    isTracker = json['is_tracker'];
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['timezone'] = timezone;
    data['deviceid'] = deviceid;
    data['hash_deviceid'] = hashDeviceid;
    data['brand'] = brand;
    data['is_tracker'] = isTracker;
    data['steps'] = steps;
    data['distance'] = distance;
    data['elevation'] = elevation;
    data['soft'] = soft;
    data['moderate'] = moderate;
    data['intense'] = intense;
    data['active'] = active;
    data['calories'] = calories;
    data['totalcalories'] = totalcalories;
    data['hr_average'] = hrAverage;
    data['hr_min'] = hrMin;
    data['hr_max'] = hrMax;
    data['hr_zone_0'] = hrZone0;
    data['hr_zone_1'] = hrZone1;
    data['hr_zone_2'] = hrZone2;
    data['hr_zone_3'] = hrZone3;
    return data;
  }

  @override
  String toString() {
    return (StringBuffer('Activities(')
          ..write('date: $date, ')
          ..write('timezone: $timezone, ')
          ..write('deviceid: $deviceid, ')
          ..write('hash_deviceid: $hashDeviceid, ')
          ..write('brand: $brand, ')
          ..write('is_tracker: $isTracker, ')
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
