class PokemonDetailModel {
  int? id;
  String? name;
  int? height;
  int? weight;
  List<Stats>? stats;
  List<Types>? types;

  PokemonDetailModel(
      {this.id, this.name, this.height, this.weight, this.stats, this.types});

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    height = json["height"];
    weight = json["weight"];
    stats = json["stats"] == null
        ? null
        : (json["stats"] as List).map((e) => Stats.fromJson(e)).toList();
    types = json["types"] == null
        ? null
        : (json["types"] as List).map((e) => Types.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["height"] = height;
    data["weight"] = weight;
    if (stats != null) {
      data["stats"] = stats?.map((e) => e.toJson()).toList();
    }
    if (types != null) {
      data["types"] = types?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Types {
  int? slot;
  Type? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json["slot"];
    type = json["type"] == null ? null : Type.fromJson(json["type"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["slot"] = slot;
    if (type != null) {
      data["type"] = type?.toJson();
    }
    return data;
  }
}

class Type {
  String? name;
  String? url;

  Type({this.name, this.url});

  Type.fromJson(Map<String, dynamic> json) {
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

class Stats {
  int? baseStat;
  int? effort;
  Stat? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json["base_stat"];
    effort = json["effort"];
    stat = json["stat"] == null ? null : Stat.fromJson(json["stat"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["base_stat"] = baseStat;
    data["effort"] = effort;
    if (stat != null) {
      data["stat"] = stat?.toJson();
    }
    return data;
  }
}

class Stat {
  String? name;
  String? url;

  Stat({this.name, this.url});

  Stat.fromJson(Map<String, dynamic> json) {
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
