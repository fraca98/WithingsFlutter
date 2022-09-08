import 'dart:math';

import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsMeasureGetmeasData] is a class that provides measures stored at a specific date
class WithingsMeasureGetmeasData implements WithingsData {
  /// Array of measure group
  List<Measuregrps>? measuregrps;

  /*/// To know if there is more data to fetch or not
  int? more;

  /// Offset to use to retrieve the next data
  int? offset;*/

  /// Default [WithingsMeasureGetmeasData] constructor
  WithingsMeasureGetmeasData({
    this.measuregrps,
    //this.more,
    //this.offset
  });

  WithingsMeasureGetmeasData.fromJson(Map<String, dynamic> json) {
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
    return (StringBuffer('WithingsMeasureGetmeasData(')
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

  /// Type of the measure. See meastypes input parameter
  int? type;

  /// Value for the measure in S.I. units (kilograms, meters etc...).
  double? value;

  Measuregrps({
    this.date,
    this.category,
    this.type,
    this.value,
  });

  Measuregrps.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    category = json['category'];
    type = json['measures'][0]['type'];
    value = json['measures'][0]['value'].toDouble() *
        pow(10, json['measures'][0]['unit']);
  }
  @override
  String toString() {
    return (StringBuffer('Measuregrps(')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  }
}

// more and offset no more present in the response