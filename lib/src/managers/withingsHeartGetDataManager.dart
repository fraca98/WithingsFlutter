import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsHeartGetDataManager] is a class the manages the requests related to [WithingsHeartGetData]
class WithingsHeartGetDataManager extends WithingsDataManager {
  WithingsHeartGetDataManager({required String accessToken})
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
    WithingsData ret = _extractWithingsHeartGetData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsHeartGetData] from the given response.
  WithingsHeartGetData _extractWithingsHeartGetData(dynamic response) {
    if (response['status'] == 0) {
      return WithingsHeartGetData.fromJson(response);
    } else {
      return WithingsHeartGetData();
    }
  } // _extractWithingsHeartGetData
}
 // WithingsHeartGetDataManager