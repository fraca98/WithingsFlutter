import 'package:logger/logger.dart';
import 'package:withings_flutter/withings_flutter.dart';

/// [WithingsMeasureGetmeasDataManager] is a class the manages the requests related to [WithingsMeasureGetmeasData]
class WithingsMeasureGetmeasDataManager extends WithingsDataManager {
  WithingsMeasureGetmeasDataManager({required String accessToken})
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
    WithingsData ret = _extractWithingsMeasureGetmeasData(response);
    return ret;
  } // fetch

  /// A private method that extracts [WithingsMeasureGetmeasData] from the given response.
  WithingsMeasureGetmeasData _extractWithingsMeasureGetmeasData(
      dynamic response) {
    if (response['status'] == 0) {
      return WithingsMeasureGetmeasData.fromJson(response);
    } else {
      return WithingsMeasureGetmeasData();
    }
  } // _extractWithingsMeasureGetmeasData
} // WithingsMeasureGetmeasDataManager