import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetintradayactivityData] is a class that returns user activity data captured at high frequency
class WithingsMeasureGetintradayactivityData implements WithingsData {
  /// Response status
  int? status;

  /// Response body
  BodyMeasureGetintradayactivity? body;

  /// Default [WithingsMeasureGetintradayactivityData] constructor
  WithingsMeasureGetintradayactivityData({this.status, this.body});

  WithingsMeasureGetintradayactivityData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null
        ? BodyMeasureGetintradayactivity.fromJson(json['body'])
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

class BodyMeasureGetintradayactivity {
  /// Object
  SeriesMeasureGetintradayactivity? series;

  BodyMeasureGetintradayactivity({this.series});

  BodyMeasureGetintradayactivity.fromJson(Map<String, dynamic> json) {
    series = json['series'] != null
        ? SeriesMeasureGetintradayactivity.fromJson(json['series'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (series != null) {
      data['series'] = series!.toJson();
    }
    return data;
  }
}

class SeriesMeasureGetintradayactivity {
  /// Object: timestamp represents the epoch value of the intraday data
  Timestamp? timestamp;

  SeriesMeasureGetintradayactivity({this.timestamp});

  SeriesMeasureGetintradayactivity.fromJson(Map<String, dynamic> json) {
    timestamp = json['$timestamp'] != null
        ? Timestamp.fromJson(json['$timestamp'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (timestamp != null) {
      data['$timestamp'] = timestamp!.toJson();
    }
    return data;
  }
}

class Timestamp {
  /// ID of device that tracked the data
  String? deviceid;

  /// Device model
  String? model;
  int? modelId;

  /// Number of steps. (Use 'dataFields' to request this data)
  int? steps;

  /// Number of floors climbed. (Use 'dataFields' to request this data)
  int? elevation;

  /// Estimation of active calories burned (in Kcal). (Use 'dataFields' to request this data)
  int? calories;

  /// Distance travelled (in meters). (Use 'dataFields' to request this data)
  int? distance;

  /// Number of strokes performed. (Use 'dataFields' to request this data)
  int? stroke;

  /// Number of pool_lap performed. (Use 'dataFields' to request this data)
  int? poolLap;

  /// Duration of the activity (in seconds). (Use 'dataFields' to request this data)
  int? duration;

  /// Measured heart rate. (Use 'dataFields' to request this data)
  int? heartRate;

  /// SpO2 measurement automatically tracked by a device tracker. (Use 'dataFields' to request this data)
  int? spo2Auto;

  Timestamp(
      {this.deviceid,
      this.model,
      this.modelId,
      this.steps,
      this.elevation,
      this.calories,
      this.distance,
      this.stroke,
      this.poolLap,
      this.duration,
      this.heartRate,
      this.spo2Auto});

  Timestamp.fromJson(Map<String, dynamic> json) {
    deviceid = json['deviceid'];
    model = json['model'];
    modelId = json['model_id'];
    steps = json['steps'];
    elevation = json['elevation'];
    calories = json['calories'];
    distance = json['distance'];
    stroke = json['stroke'];
    poolLap = json['pool_lap'];
    duration = json['duration'];
    heartRate = json['heart_rate'];
    spo2Auto = json['spo2_auto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceid'] = deviceid;
    data['model'] = model;
    data['model_id'] = modelId;
    data['steps'] = steps;
    data['elevation'] = elevation;
    data['calories'] = calories;
    data['distance'] = distance;
    data['stroke'] = stroke;
    data['pool_lap'] = poolLap;
    data['duration'] = duration;
    data['heart_rate'] = heartRate;
    data['spo2_auto'] = spo2Auto;
    return data;
  }
}
// TODO: fix it cause JSON array, not object