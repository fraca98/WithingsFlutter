import 'package:withings_flutter/src/data/withingsData.dart';

/// [WithingsSleepGetSummaryData] is a class that returns sleep activity summaries, 
/// which are an aggregation of all the data captured at high frequency during the sleep activity
class WithingsSleepGetSummaryData implements WithingsData{

  /// Response status
  int? status;
  /// Response data
  BodySleepGetSummary? body;

  /// Default [WithingsSleepGetSummaryData] constructor
  WithingsSleepGetSummaryData({this.status, this.body});

  WithingsSleepGetSummaryData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    body = json['body'].isNotEmpty ? BodySleepGetSummary.fromJson(json['body']) : null;
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

class BodySleepGetSummary {
  /// Array of SeriesSleepGetSummary objects
  List<SeriesSleepGetSummary>? series;
  /// To know if there is more data to fetch or not
  bool? more;
  /// Offset to use to retrieve the next data
  int? offset;

  BodySleepGetSummary({this.series, this.more, this.offset});

  BodySleepGetSummary.fromJson(Map<String, dynamic> json) {
    if (json['series'].isNotEmpty) {
      series = <SeriesSleepGetSummary>[];
      json['series'].forEach((v) {
        series!.add(SeriesSleepGetSummary.fromJson(v));
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

class SeriesSleepGetSummary {
  /// Timezone for the date
  String? timezone;
  /// The source for sleep data. Value can be 16 for a tracker or 32 for a Sleep Monitor
  int? model;
  int? modelId;
  /// The starting datetime for the sleep state data
  int? startdate;
  /// The end datetime for the sleep data. A single call can span up to 7 days maximum.
  /// To cover a wider time range, you will need to perform multiple calls
  int? enddate;
  /// Date at which the measure was taken or entered
  String? date;
  /// The timestamp of the creation
  int? created;
  /// The timestamp of the last modification
  int? modified;
  /// Object Data (Details of sleep)
  DataSleepGetSummary? data;

  SeriesSleepGetSummary(
      {this.timezone,
      this.model,
      this.modelId,
      this.startdate,
      this.enddate,
      this.date,
      this.created,
      this.modified,
      this.data});

  SeriesSleepGetSummary.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    model = json['model'];
    modelId = json['model_id'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    date = json['date'];
    created = json['created'];
    modified = json['modified'];
    data = json['data'].isNotEmpty ? DataSleepGetSummary.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timezone'] = timezone;
    data['model'] = model;
    data['model_id'] = modelId;
    data['startdate'] = startdate;
    data['enddate'] = enddate;
    data['date'] = date;
    data['created'] = created;
    data['modified'] = modified;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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
  //List<Null>? nightEvents;
  int? outOfBedCount;
  int? remsleepduration;
  int? rrAverage;
  int? rrMax;
  int? rrMin;
  double? sleepEfficiency;
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
      //this.nightEvents,
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
    /*if (json['night_events'].isNotEmpty) {
      nightEvents = <Null>[];
      json['night_events'].forEach((v) {
        nightEvents!.add(Null.fromJson(v));
      });
    }*/
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apnea_hypopnea_index'] = apneaHypopneaIndex;
    data['asleepduration'] = asleepduration;
    data['breathing_disturbances_intensity'] =
        breathingDisturbancesIntensity;
    data['deepsleepduration'] = deepsleepduration;
    //data['durationtosleep'] = durationtosleep; //deprecated
    //data['durationtowakeup'] = durationtowakeup; //deprecated
    data['hr_average'] = hrAverage;
    data['hr_max'] = hrMax;
    data['hr_min'] = hrMin;
    data['lightsleepduration'] = lightsleepduration;
    data['nb_rem_episodes'] = nbRemEpisodes;
    /*if (nightEvents != null) {
      data['night_events'] = nightEvents!.map((v) => v.toJson()).toList();
    }*/
    data['out_of_bed_count'] = outOfBedCount;
    data['remsleepduration'] = remsleepduration;
    data['rr_average'] = rrAverage;
    data['rr_max'] = rrMax;
    data['rr_min'] = rrMin;
    data['sleep_efficiency'] = sleepEfficiency;
    data['sleep_latency'] = sleepLatency;
    data['sleep_score'] = sleepScore;
    data['snoring'] = snoring;
    data['snoringepisodecount'] = snoringepisodecount;
    data['total_sleep_time'] = totalSleepTime;
    data['total_timeinbed'] = totalTimeinbed;
    data['wakeup_latency'] = wakeupLatency;
    data['wakeupcount'] = wakeupcount;
    data['wakeupduration'] = wakeupduration;
    data['waso'] = waso;
    return data;
  }
}

// TODO: nightEvents, aggiungere commenti, toString()
// nightEvents? di che tipo è l'array?