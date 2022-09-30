class Weed {
  final String weedName;

  Weed(
      {required this.weedName,
        });

  factory Weed.fromJSON(Map<String, dynamic> parsedJson) {
    return Weed(
        weedName: parsedJson['weed_name']);
  }
}
