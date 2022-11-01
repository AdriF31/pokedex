
class PokemonAllModel {
  int? count;
  String? next;
  dynamic previous;
  List<Results>? results;

  PokemonAllModel({this.count, this.next, this.previous, this.results});

  PokemonAllModel.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    next = json["next"];
    previous = json["previous"];
    results = json["results"] == null ? null : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["next"] = next;
    data["previous"] = previous;
    if(results != null) {
      data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
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