/// [WithingsNoHeadAPIURL] is the abstract class implementing the data model of a url of Withings APIs
abstract class WithingsNoHeadAPIURL {
  /// The string representation of the url
  String? url;

  /// The data to be attached to the url
  Map<String, dynamic>? data;

  /// Default [WithingsNoHeadAPIURL] constructor.
  WithingsNoHeadAPIURL({this.url, this.data});
}
