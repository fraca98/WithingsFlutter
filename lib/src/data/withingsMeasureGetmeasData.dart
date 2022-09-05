import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetmeasData] is a class that provides measures stored at a specific date
class WithingsMeasureGetmeasData implements WithingsData {
  /// Response status
  int? status;

  /// Response body
  BodyMeasureGetmeas? body;

  /// Default [WithingsMeasureGetmeasData] constructor
  WithingsMeasureGetmeasData({this.status, this.body});

  WithingsMeasureGetmeasData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'].isNotEmpty
        ? BodyMeasureGetmeas.fromJson(json['body'])
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

class BodyMeasureGetmeas {
  /// Server time at which the answer was generated
  String? updatetime;

  /// Timezone for the date
  String? timezone;

  /// For every measure/measurement made, a measure group is created
  List<Measuregrps>? measuregrps;

  /// To know if there is more data to fetch or not
  int? more;

  /// Offset to use to retrieve the next data
  int? offset;

  BodyMeasureGetmeas(
      {this.updatetime,
      this.timezone,
      this.measuregrps,
      this.more,
      this.offset});

  BodyMeasureGetmeas.fromJson(Map<String, dynamic> json) {
    updatetime = json['updatetime'];
    timezone = json['timezone'];
    if (json['measuregrps'].isNotEmpty) {
      measuregrps = <Measuregrps>[];
      json['measuregrps'].forEach((v) {
        measuregrps!.add(Measuregrps.fromJson(v));
      });
    }
    more = json['more'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updatetime'] = updatetime;
    data['timezone'] = timezone;
    if (measuregrps != null) {
      data['measuregrps'] = measuregrps!.map((v) => v.toJson()).toList();
    }
    data['more'] = more;
    data['offset'] = offset;
    return data;
  }
}

class Measuregrps {
  /// Unique identifier of the measure group
  int? grpid;

  /// The way the measure was attributed to the user
  int? attrib;

  /// UNIX timestamp when measures were taken
  int? date;

  /// UNIX timestamp when measures were stored
  int? created;

  /// UNIX timestamp when measures were last updated
  int? modified;

  /// Category for the measures in the group (see category input parameter)
  int? category;

  /// ID of device that tracked the data
  String? deviceid;

  /// Array of objects (List of measures in the group)
  List<Measures>? measures;

  //String? comment; //deprecated
  
  /// Timezone for the date
  String? timezone;

  Measuregrps(
      {this.grpid,
      this.attrib,
      this.date,
      this.created,
      this.modified,
      this.category,
      this.deviceid,
      this.measures,
      //this.comment, //deprecated
      this.timezone});

  Measuregrps.fromJson(Map<String, dynamic> json) {
    grpid = json['grpid'];
    attrib = json['attrib'];
    date = json['date'];
    created = json['created'];
    modified = json['modified'];
    category = json['category'];
    deviceid = json['deviceid'];
    if (json['measures'].isNotEmpty) {
      measures = <Measures>[];
      json['measures'].forEach((v) {
        measures!.add(Measures.fromJson(v));
      });
    }
    //comment = json['comment']; //deprecated
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grpid'] = grpid;
    data['attrib'] = attrib;
    data['date'] = date;
    data['created'] = created;
    data['modified'] = modified;
    data['category'] = category;
    data['deviceid'] = deviceid;
    if (measures != null) {
      data['measures'] = measures!.map((v) => v.toJson()).toList();
    }
    //data['comment'] = comment; //deprecated
    data['timezone'] = timezone;
    return data;
  }
}

class Measures {
  /// Value for the measure in S.I. units (kilograms, meters etc...).
  /// Value should be multiplied by 10 to the power of units to get the real value
  int? value;

  /// Type of the measure. See meastypes input parameter
  int? type;

  /// Power of ten to multiply the value field to get the real value.
  ///Formula: value * 10^unit = real value.
  int? unit;

  // int? algo; // deprecated
  // int? fm; // deprecated
  // int? fw; // deprecated

  Measures({
    this.value,
    this.type,
    this.unit,
    //this.algo, // deprecated
    //this.fm, // deprecated
    //this.fw, // deprecated
  });

  Measures.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
    unit = json['unit'];
    // algo = json['algo']; // deprecated
    // fm = json['fm']; // deprecated
    // fw = json['fw']; // deprecated
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['type'] = type;
    data['unit'] = unit;
    //data['algo'] = algo; // deprecated
    //data['fm'] = fm; // deprecated
    //data['fw'] = fw; // deprecated
    return data;
  }
}
// TODO: toString()
