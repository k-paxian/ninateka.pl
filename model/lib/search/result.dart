import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonMapper;

@jsonSerializable
enum AssetType { audio, video }

@jsonSerializable
enum RecordCategory { document, talks, music, theater }

@jsonSerializable
enum RecordType { asset, series }

@jsonSerializable
class SearchRecord {
  String? title;
  String? subtitle;
  String? description;
  String? url;
  String? lead;

  num? duration;

  AssetType? assetType;
  RecordCategory? category;
  RecordType? type;
}

@jsonSerializable
class SearchResponse {
  List<SearchRecord>? records;
  num? totalItems;
  num? pageNumber;
  num? pageCount;

  @override
  String toString() => JsonMapper.serialize(this);
}
