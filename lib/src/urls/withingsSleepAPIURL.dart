import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsSleepAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Withings Web APIs urls to fetch
/// [WithingsSleepGetData],[WithingsMeasureGetactivityData]
class WithingsSleepAPIURL extends WithingsAPIURL {
  ///Default [WithingsSleepAPIURL] constructor
  WithingsSleepAPIURL(
      {String? url, Map<String, dynamic>? data, String? authorizationHeader}) {
    // super fields
    this.url = url;
    this.data = data;
    this.authorizationHeader = authorizationHeader;
  } // WithingsHeartAPIURL

  /// Generates a [WithingsSleepAPIURL] to get [WithingsSleepGetData] of a specific date range
  /// between [startdate] and [enddate] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]
  factory WithingsSleepAPIURL.get({
    required int startdate,
    required int enddate,
    String? dataFields,
    required String accessToken,
  }) {
    return WithingsSleepAPIURL(
      url: 'https://wbsapi.withings.net/v2/sleep',
      data: {
        'action': 'get',
        'startdate': startdate,
        'enddate': enddate,
        'data_fields': dataFields,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsSleepAPIURL] to get [WithingsMeasureGetactivityData] of a specific date range
  /// between [startdateymd] and [enddateymd] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]
  factory WithingsSleepAPIURL.getSummaryRange({
    required String startdateymd,
    required String enddateymd,
    String? dataFields,
    required String accessToken,
  }) {
    return WithingsSleepAPIURL(
      url: 'https://wbsapi.withings.net/v2/sleep',
      data: {
        'action': 'getsummary',
        'startdateymd': startdateymd,
        'enddateymd': enddateymd,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }

  /// Generates a [WithingsSleepAPIURL] to get [WithingsMeasureGetactivityData] from the last time that data
  /// were updated or created after the date in [lastupdate] of a given user [accessToken], defining the data fields we want
  /// to retrieve [dataFields]
  factory WithingsSleepAPIURL.getSummaryLastupdate({
    required int lastupdate,
    String? dataFields,
    required String accessToken,
  }) {
    return WithingsSleepAPIURL(
      url: 'https://wbsapi.withings.net/v2/sleep',
      data: {
        'action': 'getsummary',
        'lastupdate': lastupdate,
        'data_fields': dataFields,
      },
      authorizationHeader: 'Bearer $accessToken',
    );
  }
}
