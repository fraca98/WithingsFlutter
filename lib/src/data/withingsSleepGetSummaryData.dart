import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsSleepGetSummaryData] is a class that returns sleep activity summaries,
/// which are an aggregation of all the data captured at high frequency during the sleep activity
class WithingsSleepGetSummaryData implements WithingsData {
  /// Response status
  int? status;

  /// Array of SeriesSleepGetSummary objects
  List<SeriesSleepGetSummary>? series;

  /// To know if there are more data to fetch or not
  bool? more;

  /// Offset to use to retrieve the next data
  int? offset;

  /// Default [WithingsSleepGetSummaryData] constructor
  WithingsSleepGetSummaryData(
      {this.status, this.series, this.more, this.offset});

  WithingsSleepGetSummaryData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['status'] == 0 && json['body'] != null) {
      if (json['body']['series'].isNotEmpty) {
        series = <SeriesSleepGetSummary>[];
        json['body']['series'].forEach((v) {
          series?.add(SeriesSleepGetSummary.fromJson(v));
        });
      }
      more = json['body']['more'];
      offset = json['body']['offset'];
    }
  }

  @override
  String toString() {
    return (StringBuffer('WithingsSleepGetSummaryData(')
          ..write('status: $status, ')
          ..write('series: $series, ')
          ..write('more: $more, ')
          ..write('offset: $offset, ')
          ..write(')'))
        .toString();
  }
}

class SeriesSleepGetSummary {
  /// The starting datetime for the sleep state data
  int? startdate;

  /// The end datetime for the sleep data
  int? enddate;

  /// Date at which the measure was taken or entered
  String? date;

  /// Object Data (Details of sleep)
  DataSleepGetSummary? data;

  SeriesSleepGetSummary({this.startdate, this.enddate, this.data});

  SeriesSleepGetSummary.fromJson(Map<String, dynamic> json) {
    startdate = json['startdate'];
    enddate = json['enddate'];
    date = json['date'];
    data = json['data'] != null
        ? DataSleepGetSummary.fromJson(json['data'])
        : null;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesSleepGetSummary(')
          ..write('startdate: $startdate, ')
          ..write('enddate: $enddate, ')
          ..write('date: $date, ')
          ..write('data: $data, ')
          ..write(')'))
        .toString();
  }
}

class DataSleepGetSummary {
  int? apneaHypopneaIndex;
  int? asleepduration;
  int? breathingDisturbancesIntensity;
  int? deepsleepduration;
  //int? durationtosleep; //deprecated
  //int? durationtowakeup; //deprecated
  int? hrAverage;
  int? hrMax;
  int? hrMin;
  int? lightsleepduration;
  int? nbRemEpisodes;
  List? nightEvents;
  int? outOfBedCount;
  int? remsleepduration;
  int? rrAverage;
  int? rrMax;
  int? rrMin;
  num? sleepEfficiency;
  int? sleepLatency;
  int? sleepScore;
  int? snoring;
  int? snoringepisodecount;
  int? totalSleepTime;
  int? totalTimeinbed;
  int? wakeupLatency;
  int? wakeupcount;
  int? wakeupduration;
  int? waso;

  DataSleepGetSummary(
      {this.apneaHypopneaIndex,
      this.asleepduration,
      this.breathingDisturbancesIntensity,
      this.deepsleepduration,
      //this.durationtosleep, //deprecated
      //this.durationtowakeup, //deprecated
      this.hrAverage,
      this.hrMax,
      this.hrMin,
      this.lightsleepduration,
      this.nbRemEpisodes,
      this.nightEvents,
      this.outOfBedCount,
      this.remsleepduration,
      this.rrAverage,
      this.rrMax,
      this.rrMin,
      this.sleepEfficiency,
      this.sleepLatency,
      this.sleepScore,
      this.snoring,
      this.snoringepisodecount,
      this.totalSleepTime,
      this.totalTimeinbed,
      this.wakeupLatency,
      this.wakeupcount,
      this.wakeupduration,
      this.waso});

  DataSleepGetSummary.fromJson(Map<String, dynamic> json) {
    apneaHypopneaIndex = json['apnea_hypopnea_index'];
    asleepduration = json['asleepduration'];
    breathingDisturbancesIntensity = json['breathing_disturbances_intensity'];
    deepsleepduration = json['deepsleepduration'];
    //durationtosleep = json['durationtosleep']; //deprecated
    //durationtowakeup = json['durationtowakeup']; //deprecated
    hrAverage = json['hr_average'];
    hrMax = json['hr_max'];
    hrMin = json['hr_min'];
    lightsleepduration = json['lightsleepduration'];
    nbRemEpisodes = json['nb_rem_episodes'];
    nightEvents = json['night_events'];
    outOfBedCount = json['out_of_bed_count'];
    remsleepduration = json['remsleepduration'];
    rrAverage = json['rr_average'];
    rrMax = json['rr_max'];
    rrMin = json['rr_min'];
    sleepEfficiency = json['sleep_efficiency'];
    sleepLatency = json['sleep_latency'];
    sleepScore = json['sleep_score'];
    snoring = json['snoring'];
    snoringepisodecount = json['snoringepisodecount'];
    totalSleepTime = json['total_sleep_time'];
    totalTimeinbed = json['total_timeinbed'];
    wakeupLatency = json['wakeup_latency'];
    wakeupcount = json['wakeupcount'];
    wakeupduration = json['wakeupduration'];
    waso = json['waso'];
  }

  @override
  String toString() {
    return (StringBuffer('DataSleepGetSummary(')
          ..write('apnea_hypopnea_index: $apneaHypopneaIndex, ')
          ..write('asleepduration: $asleepduration, ')
          ..write(
              'breathing_disturbances_intensity: $breathingDisturbancesIntensity, ')
          ..write('deepsleepduration: $deepsleepduration, ')
          ..write('hr_average: $hrAverage, ')
          ..write('hr_max: $hrMax, ')
          ..write('hr_min: $hrMin, ')
          ..write('lightsleepduration: $nbRemEpisodes, ')
          ..write('nb_rem_episodes: $nbRemEpisodes, ')
          ..write('night_events: $nightEvents, ')
          ..write('out_of_bed_count: $outOfBedCount, ')
          ..write('remsleepduration: $remsleepduration, ')
          ..write('rr_average: $rrAverage, ')
          ..write('rr_max: $rrMax, ')
          ..write('rr_min: $rrMin, ')
          ..write('sleep_efficiency: $sleepEfficiency, ')
          ..write('sleep_latency: $sleepLatency, ')
          ..write('sleep_score: $sleepScore, ')
          ..write('snoring: $snoring, ')
          ..write('snoringepisodecount: $snoringepisodecount, ')
          ..write('total_sleep_time: $totalSleepTime, ')
          ..write('total_timeinbed: $totalTimeinbed, ')
          ..write('wakeup_latency: $wakeupLatency, ')
          ..write('wakeupcount: $wakeupcount, ')
          ..write('wakeupduration: $wakeupduration, ')
          ..write('waso: $waso, ')
          ..write(')'))
        .toString();
  }
}

//TODO: Adattare JSON per list nel caso update
