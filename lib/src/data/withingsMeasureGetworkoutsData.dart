import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetworkoutsData] is a class that returns workout summaries, which are an aggregation all data that was captured during that workout
class WithingsMeasureGetworkoutsData implements WithingsData {
  /// Response status
  int? status;

  /// Response body
  BodyMeasureGetworkouts? body;

  /// Default [WithingsMeasureGetworkoutsData] constructor
  WithingsMeasureGetworkoutsData({this.status, this.body});

  WithingsMeasureGetworkoutsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'].isNotEmpty
        ? BodyMeasureGetworkouts.fromJson(json['body'])
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
}

class BodyMeasureGetworkouts {
  /// Array of objects (workout_object)
  List<SeriesMeasureGetworkouts>? series;

  /// To know if there is more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  BodyMeasureGetworkouts({this.series, this.more, this.offset});

  BodyMeasureGetworkouts.fromJson(Map<String, dynamic> json) {
    if (json['series'].isNotEmpty) {
      series = <SeriesMeasureGetworkouts>[];
      json['series'].forEach((v) {
        series!.add(SeriesMeasureGetworkouts.fromJson(v));
      });
    }
    more = json['more'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (series != null) {
      data['series'] = series!.map((v) => v.toJson()).toList();
    }
    data['more'] = more;
    data['offset'] = offset;
    return data;
  }
}

class SeriesMeasureGetworkouts {
  /// Category of workout
  int? category;

  /// Timezone for the date
  String? timezone;

  /// Source for the workout
  int? model;

  /// The way the measure was attributed to the user
  int? attrib;

  /// The starting datetime for workouts data
  int? startdate;

  /// The ending datetime for workouts data
  int? enddate;

  /// Date at which the measure was taken or entered
  String? date;

  /// The timestamp of the last modification
  int? modified;

  /// ID of device that tracked the data
  String? deviceid;

  /// Object (Details of workout)
  DataMeasureGetworkouts? data;

  SeriesMeasureGetworkouts(
      {this.category,
      this.timezone,
      this.model,
      this.attrib,
      this.startdate,
      this.enddate,
      this.date,
      this.modified,
      this.deviceid,
      this.data});

  SeriesMeasureGetworkouts.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    timezone = json['timezone'];
    model = json['model'];
    attrib = json['attrib'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    date = json['date'];
    modified = json['modified'];
    deviceid = json['deviceid'];
    data = json['data'].isNotEmpty
        ? DataMeasureGetworkouts.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['timezone'] = timezone;
    data['model'] = model;
    data['attrib'] = attrib;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['date'] = date;
    data['modified'] = modified;
    data['deviceid'] = deviceid;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['algo_pause_duration'] = algoPauseDuration;
    data['calories'] = calories;
    data['distance'] = distance;
    data['elevation'] = elevation;
    data['hr_average'] = hrAverage;
    data['hr_max'] = hrMax;
    data['hr_min'] = hrMin;
    data['hr_zone_0'] = hrZone0;
    data['hr_zone_1'] = hrZone1;
    data['hr_zone_2'] = hrZone2;
    data['hr_zone_3'] = hrZone3;
    data['intensity'] = intensity;
    data['manual_calories'] = manualCalories;
    data['manual_distance'] = manualDistance;
    data['pause_duration'] = pauseDuration;
    data['pool_laps'] = poolLaps;
    data['pool_length'] = poolLength;
    data['spo2_average'] = spo2Average;
    data['steps'] = steps;
    data['strokes'] = strokes;
    return data;
  }
}
//TODO: toString()
