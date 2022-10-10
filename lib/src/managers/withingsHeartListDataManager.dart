import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartListDataManager] is a class the manages the requests related to [WithingsHeartListData]
class WithingsHeartListDataManager extends WithingsDataManager {
  WithingsHeartListDataManager();

  @override
  Future<WithingsHeartListData> fetch(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    WithingsHeartListData ret = _extractWithingsHeartListData(response);
    return ret;
  } // fetch

  Future<WithingsHeartListData> fetchAutoOffset(WithingsAPIURL withingsUrl) async {
    // Get the response
    final response = await getResponse(withingsUrl);
    // Debugging
    final logger = Logger();
    logger.i('$response');
    //Extract data and return them
    WithingsHeartListData ret = _extractWithingsHeartListData(response);

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
        WithingsHeartListData retOffset =
            _extractWithingsHeartListData(response);
        return retOffset;
      } else {
        return ret; // no more data to retrieve with offset
      }
    } else {
      return ret;
    }
  }

  /// A private method that extracts [WithingsHeartListData] from the given response.
  WithingsHeartListData _extractWithingsHeartListData(dynamic response) {
    if (response['status'] == 0) {
      return WithingsHeartListData.fromJson(response);
    } else {
      return WithingsHeartListData();
    }
  } // _extractWithingsHeartListData
}
 // WithingsHeartListDataManager