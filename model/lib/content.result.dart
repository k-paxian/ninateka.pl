import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonMapper;
import 'core.types.dart';

@jsonSerializable
class Episode {
  num? atdId;
  String? title;
  AssetType? assetType;
}

@jsonSerializable
class Season {
  List<Episode>? episodes;
}

@jsonSerializable
class Content {
  num? atdId;
  String? description;
  String? title;
  List<Season>? seasons;

  AssetType? assetType;
}

@jsonSerializable
class ContentResponse {
  Content? content;

  @override
  String toString() => JsonMapper.serialize(this);
}
