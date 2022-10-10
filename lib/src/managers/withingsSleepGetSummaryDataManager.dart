import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsSleepGetSummaryDataManager] is a class the manages the requests related to [WithingsSleepGetSummaryData]
class WithingsSleepGetSummaryDataManager extends WithingsDataManager {
  WithingsSleepGetSummaryDataManager();

  @override
  Future<WithingsSleepGetSummaryData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsSleepGetSummaryData ret =
        _extractWithingsSleepGetSummaryData(response);
    return ret;
  } // fetch

  Future<WithingsSleepGetSummaryData> fetchAutoOffset(
      WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);
    // Debugging
    final logger = Logger();
    logger.i('$response');
    //Extract data and return them
    WithingsSleepGetSummaryData ret =
        _extractWithingsSleepGetSummaryData(response);

    // Check the response
    if (ret.series != null) {
      //response not null
      if (ret.more == true) {
        //i have more data to retrieve with offset
        withingsUrl.data!['offset'] = ret.offset;

        // Get the response
        final response = await getResponse(withingsUrl);
        // Debugging
        final logger = Logger();
        logger.i('$response');
        //Extract data and return them
        WithingsSleepGetSummaryData retOffset =
            _extractWithingsSleepGetSummaryData(response);
        return retOffset;
      } else {
        return ret; // no more data to retrieve with offset
      }
    } else {
      return ret;
    }
  }

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

//WARNING: more/offset not included in documentation as queryparameters, but they are in the response, so implement fetchAutoOffset