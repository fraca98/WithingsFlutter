import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsHeartGetData] is a class that provides the high frequency data of an ECG recording in micro-volt (μV) of the user
class WithingsHeartGetData implements WithingsData {
  /// Array: Signal value in micro-volt (μV)
  List<int>? signal;

  /// Signal Sampling Frequency (Hz)
  int? samplingFrequency;

  /// Where the user is wearing the device
  int? wearposition;

  /// Default [WithingsHeartGetData] constructor
  WithingsHeartGetData(
      {this.signal, this.samplingFrequency, this.wearposition});

  WithingsHeartGetData.fromJson(Map<String, dynamic> json) {
    if (json['status'] == 0 && json['body'] != null) {
      signal = json['body']['signal'].cast<int>();
      samplingFrequency = json['body']['sampling_frequency'];
      wearposition = json['body']['wearposition'];
    }
  }

  @override
  String toString() {
    return (StringBuffer('WithingsHeartGetData(')
          ..write('signal: $signal, ')
          ..write('samplingFrequency: $samplingFrequency')
          ..write('wearposition: $wearposition')
          ..write(')'))
        .toString();
  }
}
