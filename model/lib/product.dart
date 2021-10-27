import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonMapper, JsonProperty;

@jsonSerializable
class DashSource {
  String? src;
}

@jsonSerializable
class SSSource {
  String? src;
}

@jsonSerializable
class HLSSource {
  String? src;
  String? cert;
}

@jsonSerializable
class VideoSources {
  @JsonProperty(name: 'DASH')
  List<DashSource>? dash;

  @JsonProperty(name: 'HLS')
  List<HLSSource>? hls;

  @JsonProperty(name: 'SS')
  List<SSSource>? ss;
}

@jsonSerializable
class VideoDescriptor {
  VideoSources? sources;
  @override
  String toString() => JsonMapper.serialize(this);
}

@jsonSerializable
class Product {
  num? id;
  bool? audio;
  bool? video;
  bool? trailer;
  String? slug;
  String? title;
  String? webUrl;

  @override
  String toString() => JsonMapper.serialize(this);
}
