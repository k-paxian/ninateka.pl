import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonMapper, JsonProperty;

@jsonSerializable
enum YesNo { yes, no }

@jsonSerializable
enum AssetType { audio, video }

@jsonSerializable
enum RecordCategory { document, talks, music, theater }

@jsonSerializable
enum RecordType { asset, series }

@jsonSerializable
class SearchQueryParameters {
  @JsonProperty(defaultValue: 1)
  num? page;

  @JsonProperty(defaultValue: 45)
  num? limit;

  @JsonProperty(name: 'field_searchable.0', defaultValue: YesNo.yes)
  YesNo? fieldSearchable;

  @JsonProperty(name: 'searchPhrase.3', defaultValue: '')
  String? searchPhrase;

  @JsonProperty(
      name: '__NodeTypeAlias.2',
      defaultValue: RecordType.values,
      converterParams: {'delimiter': ','})
  List<RecordType>? types;

  SearchQueryParameters({this.searchPhrase, this.page});
}

@jsonSerializable
class ImageDescriptor {
  String? title;
  String? redirect;
  String? url;
  String? author;
  String? alt;
}

@jsonSerializable
class SearchRecord {
  String? title;
  String? subtitle;
  String? description;
  String? url;
  String? lead;

  num? duration;

  ImageDescriptor? image;
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
