import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsSleepGetData] is a class that returns sleep data captured at high frequency, including sleep stages
class WithingsSleepGetData implements WithingsData {
  /// Series SeriesSleepGet
  List<SeriesSleepGet>? series;

  /// Default [WithingsSleepGetData] constructor
  WithingsSleepGetData({this.series});

  WithingsSleepGetData.fromJson(Map<String, dynamic> json) {
    if (json['status'] == 0 && json['body'] != null) {
      if (json['body']['series'].isNotEmpty) {
        series = <SeriesSleepGet>[];
        json['body']['series'].forEach((v) {
          series?.add(SeriesSleepGet.fromJson(v));
        });
      }
    }
  }

  @override
  String toString() {
    return (StringBuffer('WithingsSleepGetData(')
          ..write('series: $series, ')
          ..write(')'))
        .toString();
  }
}

class SeriesSleepGet {
  /// The state of sleeping
  int? state;

  /// Series (Heart rate)
  SeriesTimestampSleepGet? hr;

  /// Series (Respiration Rate)
  SeriesTimestampSleepGet? rr;

  /// Series (Total snoring time)
  SeriesTimestampSleepGet? snoring;

  /// Series (Heart rate variability - Standard deviation of the NN over 1 minute)
  SeriesTimestampSleepGet? sdnn1;

  /// Series (Heart rate variability - Root mean square of the successive differences over "a few seconds")
  SeriesTimestampSleepGet? rmssd;

  SeriesSleepGet(
      {this.state, this.hr, this.rr, this.snoring, this.sdnn1, this.rmssd});

  SeriesSleepGet.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    hr = json['hr'] != null
        ? SeriesTimestampSleepGet.fromJson(json['hr'])
        : null;
    rr = json['rr'] != null
        ? SeriesTimestampSleepGet.fromJson(json['rr'])
        : null;
    snoring = json['snoring'] != null
        ? SeriesTimestampSleepGet.fromJson(json['snoring'])
        : null;
    sdnn1 = json['sdnn_1'] != null
        ? SeriesTimestampSleepGet.fromJson(json['sdnn_1'])
        : null;
    rmssd = json['rmssd'] != null
        ? SeriesTimestampSleepGet.fromJson(json['rmssd'])
        : null;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesSleepGet(')
          ..write('state: $state, ')
          ..write('hr: $hr, ')
          ..write('rr: $rr, ')
          ..write('snoring: $snoring, ')
          ..write('sdnn_1: $sdnn1, ')
          ..write('rmssd: $rmssd, ')
          ..write(')'))
        .toString();
  }
}

class SeriesTimestampSleepGet {
  /// List of ObjSleepGet
  List<ObjSleepGet>? seriesTimestampSleepGet;

  SeriesTimestampSleepGet({this.seriesTimestampSleepGet});

  SeriesTimestampSleepGet.fromJson(Map<String, dynamic> json) {
    seriesTimestampSleepGet = <ObjSleepGet>[];
    json.forEach((key, value) {
      seriesTimestampSleepGet?.add(ObjSleepGet(timestamp: int.parse(key), value: value));
    });
  }

  @override
  String toString() {
    return (StringBuffer('SeriesTimestampSleepGet(')
          ..write('series: $seriesTimestampSleepGet, ')
          ..write(')'))
        .toString();
  }
}

class ObjSleepGet {
  /// Timestamp
  int? timestamp;

  /// Value associated to the timestamp
  int? value;

  ObjSleepGet({this.timestamp, this.value});

  @override
  String toString() {
    return (StringBuffer('ObjSleepGet(')
          ..write('timestamp: $timestamp, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  }
}
