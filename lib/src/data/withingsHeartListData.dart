import 'package:withings_flutter/withings_flutter.dart';

class WithingsHeartListData implements WithingsData {
  int? status;
  Body? body;

  WithingsHeartListData({this.status, this.body});

  WithingsHeartListData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  @override
  Map<String, dynamic> toJson<T extends WithingsData>() {
    return <String, dynamic>{
      'status': status,
      'body': body,
    };
  }
}

class Body {
  List<Series>? series;
  bool? more;
  int? offset;

  Body({this.series, this.more, this.offset});

  Body.fromJson(Map<String, dynamic> json) {
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
  String? deviceid;
  int? model;
  Ecg? ecg;
  Bloodpressure? bloodpressure;
  int? heartRate;
  int? timestamp;
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
  int? signalid;
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
  int? diastole;
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