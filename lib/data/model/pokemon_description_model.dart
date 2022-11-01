
class PokemonDescriptionModel {
  List<FlavorTextEntries>? flavorTextEntries;

  PokemonDescriptionModel({this.flavorTextEntries});

  PokemonDescriptionModel.fromJson(Map<String, dynamic> json) {
    flavorTextEntries = json["flavor_text_entries"] == null ? null : (json["flavor_text_entries"] as List).map((e) => FlavorTextEntries.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(flavorTextEntries != null) {
      _data["flavor_text_entries"] = flavorTextEntries?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class FlavorTextEntries {
  String? flavorText;
  Language? language;
  Version? version;

  FlavorTextEntries({this.flavorText, this.language, this.version});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json["flavor_text"];
    language = json["language"] == null ? null : Language.fromJson(json["language"]);
    version = json["version"] == null ? null : Version.fromJson(json["version"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["flavor_text"] = flavorText;
    if(language != null) {
      _data["language"] = language?.toJson();
    }
    if(version != null) {
      _data["version"] = version?.toJson();
    }
    return _data;
  }
}

class Version {
  String? name;
  String? url;

  Version({this.name, this.url});

  Version.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["url"] = url;
    return _data;
  }
}

class Language {
  String? name;
  String? url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["url"] = url;
    return _data;
  }
}