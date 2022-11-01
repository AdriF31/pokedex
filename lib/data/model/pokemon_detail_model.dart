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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["height"] = height;
    _data["weight"] = weight;
    if (stats != null) {
      _data["stats"] = stats?.map((e) => e.toJson()).toList();
    }
    if (types != null) {
      _data["types"] = types?.map((e) => e.toJson()).toList();
    }
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["slot"] = slot;
    if (type != null) {
      _data["type"] = type?.toJson();
    }
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["url"] = url;
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["base_stat"] = baseStat;
    _data["effort"] = effort;
    if (stat != null) {
      _data["stat"] = stat?.toJson();
    }
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["url"] = url;
    return _data;
  }
}
