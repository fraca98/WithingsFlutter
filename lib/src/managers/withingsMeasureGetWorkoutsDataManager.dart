import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureGetWorkoutsDataManager] is a class the manages the requests related to [WithingsMeasureGetWorkoutsData]
class WithingsMeasureGetWorkoutsDataManager extends WithingsDataManager {
  WithingsMeasureGetWorkoutsDataManager();

  @override
  Future<WithingsMeasureGetWorkoutsData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsMeasureGetWorkoutsData ret = _extractWithingsMeasureGetWorkoutsData(response);
    return ret;
  } // fetch

  Future<WithingsMeasureGetWorkoutsData> fetchAutoOffset(
      WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);
    // Debugging
    final logger = Logger();
    logger.i('$response');
    //Extract data and return them
    WithingsMeasureGetWorkoutsData ret =
        _extractWithingsMeasureGetWorkoutsData(response);

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
        WithingsMeasureGetWorkoutsData retOffset =
            _extractWithingsMeasureGetWorkoutsData(response);
        return retOffset;
      } else {
        return ret; // no more data to retrieve with offset
      }
    } else {
      return ret;
    }
  }

  /// A private method that extracts [WithingsMeasureGetWorkoutsData] from the given response.
  WithingsMeasureGetWorkoutsData _extractWithingsMeasureGetWorkoutsData(
      dynamic response) {
    if (response['status'] == 0) {
      return WithingsMeasureGetWorkoutsData.fromJson(response);
    } else {
      return WithingsMeasureGetWorkoutsData();
    }
  } // _extractWithingsMeasureGetworkoutsData
} // WithingsMeasureGetWorkoutsDataManager