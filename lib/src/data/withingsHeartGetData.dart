import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsHeartGetData] is a class that provides the high frequency data of an ECG recording in micro-volt (μV) of the user
class WithingsHeartGetData implements WithingsData {
  /// Array: Signal value in micro-volt (μV)
  List<int>? signal;

  /// Signal Sampling Frequency (Hz)
  int? samplingfrequency;

  /// Where the user is wearing the device
  int? wearposition;

  /// Default [WithingsHeartGetData] constructor.
  WithingsHeartGetData({
    this.signal,
    this.samplingfrequency,
    this.wearposition,
  });

  /// Default [WithingsHeartGetData] constructor.
  factory WithingsHeartGetData.fromJson({required Map<String, dynamic> json}) {
    return WithingsHeartGetData(
      signal: json['signal'],
      samplingfrequency: json['samplingfrequency'],
      wearposition: json['wearposition'],
    );
  }

  @override
  String toString() {
    return (StringBuffer('WithingsHeartGetData(')
          ..write('signal: $signal, ')
          ..write('samplingfrequency: $samplingfrequency, ')
          ..write('wearposition: $wearposition, ')
          ..write(')'))
        .toString();
  }

  @override
  Map<String, dynamic> toJson<T extends WithingsData>() {
    return <String, dynamic>{
      'signal': signal,
      'samplingfrequency': samplingfrequency,
      'wearposition': wearposition,
    };
  }
}
