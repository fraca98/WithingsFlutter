import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartListData] is a class that returns a list of ECG records and Afib classification for a given period of time
class WithingsHeartListData implements WithingsData {
  /// Response status
  int? status;

  /// Array of objects
  List<SeriesHeartList>? series;

  /// To know if there is more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  /// Default [WithingsHeartListData] constructor
  WithingsHeartListData({this.status, this.series, this.more, this.offset});

  WithingsHeartListData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['status'] == 0 && json['body'] != null) {
      if (json['body']['series'].isNotEmpty) {
        series = <SeriesHeartList>[];
        json['body']['series'].forEach((v) {
          if (v['ecg'] != null) {
            series?.add(SeriesHeartList.fromJson(v));
          }
        });
      }
      more = json['body']['more'];
      offset = json['body']['offset'];
    }
  }

  @override
  String toString() {
    return (StringBuffer('WithingsHeartListData(')
          ..write('status: $status, ')
          ..write('series: $series, ')
          ..write('more: $more, ')
          ..write('offset: $offset, ')
          ..write(')'))
        .toString();
  }
}

class SeriesHeartList {
  /// Timestamp of the recording
  int? timestamp;

  /// Object ECG
  Ecg? ecg;

  /// Object bloodpressure
  Bloodpressure? bloodpressure;

  /// Average recorded heart rate
  int? avgHeartRate;

  SeriesHeartList({
    this.ecg,
    this.bloodpressure,
    this.avgHeartRate,
    this.timestamp,
  });

  SeriesHeartList.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    ecg = Ecg.fromJson(json['ecg']);
    bloodpressure = json['bloodpressure'] != null
        ? Bloodpressure.fromJson(json['bloodpressure'])
        : null;
    avgHeartRate = json['heart_rate'];
  }

  @override
  String toString() {
    return (StringBuffer('SeriesHeartList(')
          ..write('timestamp: $timestamp, ')
          ..write('ecg: $ecg, ')
          ..write('bloodpressure: $bloodpressure, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write(')'))
        .toString();
  }
}

class Ecg {
  /// Id of the signal
  int? signalid;

  /// Atrial fibrillation classification
  int? afib;

  Ecg({this.signalid, this.afib});

  Ecg.fromJson(Map<String, dynamic> json) {
    signalid = json['signalid'];
    afib = json['afib'];
  }

  @override
  String toString() {
    return (StringBuffer('Ecg(')
          ..write('signalid: $signalid, ')
          ..write('afib: $afib, ')
          ..write(')'))
        .toString();
  }
}

class Bloodpressure {
  /// Diastole value
  int? diastole;

  /// Systole value
  int? systole;

  Bloodpressure({this.diastole, this.systole});

  Bloodpressure.fromJson(Map<String, dynamic> json) {
    diastole = json['diastole'];
    systole = json['systole'];
  }

  @override
  String toString() {
    return (StringBuffer('Bloodpressure(')
          ..write('diastole: $diastole, ')
          ..write('systole: $systole, ')
          ..write(')'))
        .toString();
  }
}
