import 'package:dart_json_mapper/dart_json_mapper.dart'
    show jsonSerializable, JsonMapper, JsonProperty;

@jsonSerializable
class SourceDescriptor {
  String? src;
}

@jsonSerializable
class CertSourceDescriptor extends SourceDescriptor {
  String? cert;
}

@jsonSerializable
class VideoSources {
  @JsonProperty(name: 'DASH')
  List<SourceDescriptor>? dash;

  @JsonProperty(name: 'HLS')
  List<CertSourceDescriptor>? hls;

  @JsonProperty(name: 'SS')
  List<SourceDescriptor>? ss;
}

@jsonSerializable
class DigitalRightsManagement {
  @JsonProperty(name: 'FAIRPLAY')
  CertSourceDescriptor? fairPlay;

  @JsonProperty(name: 'PLAYREADY')
  SourceDescriptor? playReady;

  @JsonProperty(name: 'WIDEVINE')
  SourceDescriptor? widewine;
}

@jsonSerializable
class VideoDescriptor {
  VideoSources? sources;
  DigitalRightsManagement? drm;

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
