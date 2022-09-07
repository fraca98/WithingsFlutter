import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartListData] is a class that returns a list of ECG records and Afib classification for a given period of time
class WithingsHeartListData implements WithingsData {
  /// Response status
  int? status;

  /// Response data
  BodyHeartList? body;

  WithingsHeartListData({this.status, this.body});

  factory WithingsHeartListData.fromJson(Map<String, dynamic> json) {
    return WithingsHeartListData(
      status: json['status'],
      body: json['body'] != null ? BodyHeartList.fromJson(json['body']) : null,
    );
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
    return (StringBuffer('WithingsHeartListData(')
          ..write('status: $status, ')
          ..write('body: $body, ')
          ..write(')'))
        .toString();
  }
}

class BodyHeartList {
  /// Array of objects
  List<SeriesHeartList>? series;

  /// To know if there is more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  BodyHeartList({this.series, this.more, this.offset});

  BodyHeartList.fromJson(Map<String, dynamic> json) {
    if (json['series'].isNotEmpty) {
      series = <SeriesHeartList>[];
      json['series'].forEach((v) {
        series!.add(SeriesHeartList.fromJson(v));
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

  @override
  String toString() {
    return (StringBuffer('BodyHeartList(')
          ..write('series: $series, ')
          ..write('more: $more, ')
          ..write('offset: $offset, ')
          ..write(')'))
        .toString();
  }
}

class SeriesHeartList {
  /// ID of device that tracked the data
  String? deviceid;

  /// The source of the recording
  int? model;

  /// Object ECG
  Ecg? ecg;

  /// Object bloodpressure
  Bloodpressure? bloodpressure;

  /// Average recorded heart rate
  int? heartRate;

  /// Timestamp of the recording
  int? timestamp;

  /// Timezone for the date
  String? timezone;

  SeriesHeartList(
      {this.deviceid,
      this.model,
      this.ecg,
      this.bloodpressure,
      this.heartRate,
      this.timestamp,
      this.timezone});

  SeriesHeartList.fromJson(Map<String, dynamic> json) {
    deviceid = json['deviceid'];
    model = json['model'];
    ecg = json['ecg'] != null ? Ecg.fromJson(json['ecg']) : null;
    bloodpressure = json['bloodpressure'] != null
        ? Bloodpressure.fromJson(json['bloodpressure'])
        : null;
    heartRate = json['heart_rate'];
    timestamp = json['timestamp'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceid'] = deviceid;
    data['model'] = model;
    if (ecg != null) {
      data['ecg'] = ecg!.toJson();
    }
    if (bloodpressure != null) {
      data['bloodpressure'] = bloodpressure!.toJson();
    }
    data['heart_rate'] = heartRate;
    data['timestamp'] = timestamp;
    data['timezone'] = timezone;
    return data;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesHeartList(')
          ..write('deviceid: $deviceid, ')
          ..write('model: $model, ')
          ..write('ecg: $ecg, ')
          ..write('bloodpressure: $bloodpressure, ')
          ..write('heart_rate: $heartRate, ')
          ..write('timestamp: $timestamp, ')
          ..write('timezone: $timezone, ')
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['signalid'] = signalid;
    data['afib'] = afib;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['diastole'] = diastole;
    data['systole'] = systole;
    return data;
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
