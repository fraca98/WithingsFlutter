import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartListData] is a class that returns a list of ECG records and Afib classification for a given period of time
class WithingsHeartListData implements WithingsData {
  /// Response status
  int? status;

  /// Response data
  BodyHeartList? body;

  WithingsHeartListData({this.status, this.body});

  WithingsHeartListData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? BodyHeartList.fromJson(json['body']) : null;
  }

  @override
  Map<String, dynamic> toJson<T extends WithingsData>() {
    return <String, dynamic>{
      'status': status,
      'body': body,
    };
  }
}

class BodyHeartList {
  /// Array of objects
  List<Series>? series;

  /// To know if there is more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  BodyHeartList({this.series, this.more, this.offset});

  BodyHeartList.fromJson(Map<String, dynamic> json) {
    if (json['series'] != null) {
      series = <Series>[];
      json['series'].forEach((v) {
        series!.add(Series.fromJson(v));
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

class Series {
  /// ID of device that tracked the data
  String? deviceid;

  /// The source of the recording
  int? model;

  /// Object ecg
  Ecg? ecg;

  /// Object bloodpressure
  Bloodpressure? bloodpressure;

  /// Average recorded heart rate
  int? heartRate;

  /// Timestamp of the recording
  int? timestamp;

  /// Timezone for the date
  String? timezone;

  Series(
      {this.deviceid,
      this.model,
      this.ecg,
      this.bloodpressure,
      this.heartRate,
      this.timestamp,
      this.timezone});

  Series.fromJson(Map<String, dynamic> json) {
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
}

//TO DO: commentare e aggiungere toString()