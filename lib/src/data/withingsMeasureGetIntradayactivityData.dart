import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetIntradayactivityData] is a class that returns user activity data captured at high frequency
class WithingsMeasureGetIntradayactivityData implements WithingsData {
  /// List of ObjGetIntradayAcitvity
  List<ObjGetIntradayAcitvity>? series;

  /// Default [WithingsMeasureGetIntradayactivityData] constructor
  WithingsMeasureGetIntradayactivityData({this.series});

  WithingsMeasureGetIntradayactivityData.fromJson(Map<String, dynamic> json) {
    if (json['status'] == 0 && json['body'] != null) {
      if (json['body']['series'].isNotEmpty) {
        series = <ObjGetIntradayAcitvity>[];
        json['body']['series'].forEach((key, value) {
          series?.add(ObjGetIntradayAcitvity(
            timestamp: int.parse(key),
            steps: value['steps'],
            elevation: value['elevation'],
            calories: value['calories'],
            distance: value['distance'],
            stroke: value['stroke'],
            poolLap: value['pool_lap'],
            duration: value['duration'],
            heartRate: value['heart_rate'],
            spo2Auto: value['spo2_auto'],
          ));
        });
      }
    }
  }
  @override
  String toString() {
    return (StringBuffer('WithingsMeasureGetIntradayactivityData(')
          ..write('seris:  $series, ')
          ..write(')'))
        .toString();
  }
}

class ObjGetIntradayAcitvity {
  /// Epoch value of the intraday data
  int? timestamp;

  /// Number of steps. (Use 'dataFields' to request this data)
  int? steps;

  /// Number of floors climbed. (Use 'dataFields' to request this data)
  int? elevation;

  /// Estimation of active calories burned (in Kcal). (Use 'dataFields' to request this data)
  num? calories;

  /// Distance travelled (in meters). (Use 'dataFields' to request this data)
  num? distance;

  /// Number of strokes performed. (Use 'dataFields' to request this data)
  int? stroke;

  /// Number of pool_lap performed. (Use 'dataFields' to request this data)
  int? poolLap;

  /// Duration of the activity (in seconds). (Use 'dataFields' to request this data)
  int? duration;

  /// Measured heart rate. (Use 'dataFields' to request this data)
  int? heartRate;

  /// SpO2 measurement automatically tracked by a device tracker. (Use 'dataFields' to request this data)
  num? spo2Auto;

  ObjGetIntradayAcitvity({
    this.timestamp,
    this.steps,
    this.elevation,
    this.calories,
    this.distance,
    this.stroke,
    this.poolLap,
    this.duration,
    this.heartRate,
    this.spo2Auto,
  });

  @override
  String toString() {
    return (StringBuffer('ObjGetIntradayActivity(')
          ..write('timestamp:  $timestamp, ')
          ..write('steps:  $steps, ')
          ..write('elevation:  $elevation, ')
          ..write('calories:  $calories, ')
          ..write('distance:  $distance, ')
          ..write('stroke:  $stroke, ')
          ..write('poolLap:  $poolLap, ')
          ..write('duration:  $duration, ')
          ..write('heartRate:  $heartRate, ')
          ..write('spo2Auto:  $spo2Auto, ')
          ..write(')'))
        .toString();
  }
}
