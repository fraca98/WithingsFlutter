import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsSleepGetSummaryDataManager] is a class the manages the requests related to [WithingsSleepGetSummaryData]
class WithingsSleepGetSummaryDataManager extends WithingsDataManager {
  WithingsSleepGetSummaryDataManager({required String accessToken})
      : super(
          accessToken: accessToken,
        );

  @override
  Future<WithingsData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsData ret = _extractWithingsSleepGetSummaryData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsSleepGetSummaryData] from the given response.
  WithingsSleepGetSummaryData _extractWithingsSleepGetSummaryData(
      dynamic response) {
    if (response['status'] == 0) {
      return WithingsSleepGetSummaryData.fromJson(response);
    } else {
      return WithingsSleepGetSummaryData();
    }
  } // _extractWithingsSleepGetSummaryData
} // WithingsSleepGetSummaryDataManager

// TODO: aggiungere metodo automatico per offset