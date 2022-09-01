/// [WithingsAPIURL] is the abstract class implementing the data model of a url of Withings APIs
abstract class WithingsAPIURL {
  /// The string representation of the url
  String? url;

  /// The data to be attached to the url
  Map<String, dynamic>? data;

  /// The authorization header of the url
  String? authorizationHeader;

  /// Default [WithingsAPIURL] constructor.
  WithingsAPIURL({this.url, this.data, this.authorizationHeader});
}
