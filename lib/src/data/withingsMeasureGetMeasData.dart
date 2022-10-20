import 'dart:math';

import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetMeasData] is a class that provides measures stored at a specific date
class WithingsMeasureGetMeasData implements WithingsData {
  /// Response status
  int? status;

  /// Array of measure group
  List<Measuregrps>? measuregrps;

  /*/// To know if there is more data to fetch or not
  int? more;

  /// Offset to use to retrieve the next data
  int? offset;*/

  /// Default [WithingsMeasureGetMeasData] constructor
  WithingsMeasureGetMeasData({
    this.status,
    this.measuregrps,
    //this.more,
    //this.offset
  });

  WithingsMeasureGetMeasData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['status'] == 0 && json['body'] != null) {
      if (json['body']['measuregrps'].isNotEmpty) {
        measuregrps = <Measuregrps>[];
        json['body']['measuregrps'].forEach((v) {
          measuregrps?.add(Measuregrps.fromJson(v));
        });
      }
      //more = json['body']['more'];
      //offset = json['body']['offset'];
    }
  }

  @override
  String toString() {
    return (StringBuffer('WithingsMeasureGetMeasData(')
          ..write('status: $status, ')
          ..write('measuregrps: $measuregrps, ')
          //..write('more: $more, ')
          //..write('offset: $offset, ')
          ..write(')'))
        .toString();
  }
}

class Measuregrps {
  /// UNIX timestamp when measures were taken
  int? date;

  /// Category for the measures in the group (see category input parameter)
  int? category;

  /// List of single measures
  List<SingleMeas>? measures;

  Measuregrps({
    this.date,
    this.category,
    this.measures,
  });

  Measuregrps.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    category = json['category'];
    measures = <SingleMeas>[];
    json['measures'].forEach((v) {
      measures?.add(SingleMeas.fromJson(v));
    });
  }
  @override
  String toString() {
    return (StringBuffer('Measuregrps(')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('measures: $measures, ')
          ..write(')'))
        .toString();
  }
}

class SingleMeas {
  /// Type of the measure. See meastypes input parameter
  int? type;

  /// Value for the measure in S.I. units (kilograms, meters etc...).
  double? value;

  SingleMeas({this.type, this.value});

  SingleMeas.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'].toDouble() * pow(10, json['unit']);
  }

  @override
  String toString() {
    return (StringBuffer('SingleMeas(')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  }
}
// more and offset no more present in the response