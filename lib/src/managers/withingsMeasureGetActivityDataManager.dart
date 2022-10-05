import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureGetActivityDataManager] is a class the manages the requests related to [WithingsMeasureGetActivityData]
class WithingsMeasureGetActivityDataManager extends WithingsDataManager {
  WithingsMeasureGetActivityDataManager();

  @override
  Future<WithingsData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsData ret = _extractWithingsMeasureGetActivityData(response);
    return ret;
  } // fetch

  Future<WithingsMeasureGetActivityData> fetchAutoOffset(
      WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);
    // Debugging
    final logger = Logger();
    logger.i('$response');
    //Extract data and return them
    WithingsMeasureGetActivityData ret =
        _extractWithingsMeasureGetActivityData(response);

    // Check the response
    if (ret.activities != null) {
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
        WithingsMeasureGetActivityData retOffset =
            _extractWithingsMeasureGetActivityData(response);
        return retOffset;
      } else {
        return ret; // no more data to retrieve with offset
      }
    } else {
      return ret;
    }
  }

  /// A private method that extracts [WithingsMeasureGetActivityData] from the given response.
  WithingsMeasureGetActivityData _extractWithingsMeasureGetActivityData(
      dynamic response) {
    if (response['status'] == 0) {
      return WithingsMeasureGetActivityData.fromJson(response);
    } else {
      return WithingsMeasureGetActivityData();
    }
  } // _extractWithingsMeasureGetActivityData
} // WithingsMeasureGetActivityDataManager