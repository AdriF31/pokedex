
class PokemonDescriptionModel {
  List<FlavorTextEntries>? flavorTextEntries;

  PokemonDescriptionModel({this.flavorTextEntries});

  PokemonDescriptionModel.fromJson(Map<String, dynamic> json) {
    flavorTextEntries = json["flavor_text_entries"] == null ? null : (json["flavor_text_entries"] as List).map((e) => FlavorTextEntries.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(flavorTextEntries != null) {
      data["flavor_text_entries"] = flavorTextEntries?.map((e) => e.toJson()).toList();
    }
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["flavor_text"] = flavorText;
    if(language != null) {
      data["language"] = language?.toJson();
    }
    if(version != null) {
      data["version"] = version?.toJson();
    }
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["url"] = url;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["url"] = url;
    return data;
  }
}