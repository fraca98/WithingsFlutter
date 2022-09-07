import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsHeartGetData] is a class that provides the high frequency data of an ECG recording in micro-volt (μV) of the user
class WithingsHeartGetData implements WithingsData {
  /// Response status
  int? status;

  /// Response data
  BodyHeartGet? body;

  /// Default [WithingsHeartGetData] constructor
  WithingsHeartGetData({this.status, this.body});

  factory WithingsHeartGetData.fromJson(Map<String, dynamic> json) {
    return WithingsHeartGetData(
      status: json['status'],
      body: json['body'] != null ? BodyHeartGet.fromJson(json['body']) : null,
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
    return (StringBuffer('WithingsHeartGetData(')
          ..write('status: $status, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class BodyHeartGet {
  /// Array: Signal value in micro-volt (μV)
  List<int>? signal;

  /// Signal Sampling Frequency (Hz)
  int? samplingFrequency;

  /// Where the user is wearing the device
  int? wearposition;

  BodyHeartGet({this.signal, this.samplingFrequency, this.wearposition});

  BodyHeartGet.fromJson(Map<String, dynamic> json) {
    signal = json['signal'].cast<int>();
    samplingFrequency = json['sampling_frequency'];
    wearposition = json['wearposition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['signal'] = signal;
    data['sampling_frequency'] = samplingFrequency;
    data['wearposition'] = wearposition;
    return data;
  }

  @override
  String toString() {
    return (StringBuffer('BodyHeartGet(')
          ..write('signal: $signal, ')
          ..write('sampling_frequency: $samplingFrequency, ')
          ..write('wearposition: $wearposition, ')
          ..write(')'))
        .toString();
  }
}
