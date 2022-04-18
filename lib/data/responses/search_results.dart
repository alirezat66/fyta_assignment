class SearchResults {
  SearchResults({
    required this.query,
    required this.language,
    required this.preferedReferential,
    required this.bestMatch,
    required this.results,
    required this.version,
    required this.remainingIdentificationRequests,
  });
  late final Query query;
  late final String language;
  late final String preferedReferential;
  late final String bestMatch;
  late final List<Results> results;
  late final String version;
  late final int remainingIdentificationRequests;

  SearchResults.fromJson(Map<String, dynamic> json) {
    query = Query.fromJson(json['query']);
    language = json['language'];
    preferedReferential = json['preferedReferential'];
    bestMatch = json['bestMatch'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    version = json['version'];
    remainingIdentificationRequests = json['remainingIdentificationRequests'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['query'] = query.toJson();
    _data['language'] = language;
    _data['preferedReferential'] = preferedReferential;
    _data['bestMatch'] = bestMatch;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['version'] = version;
    _data['remainingIdentificationRequests'] = remainingIdentificationRequests;
    return _data;
  }
}

class Query {
  Query({
    required this.project,
    required this.images,
    required this.organs,
    required this.includeRelatedImages,
  });
  late final String project;
  late final List<String> images;
  late final List<String> organs;
  late final bool includeRelatedImages;

  Query.fromJson(Map<String, dynamic> json) {
    project = json['project'];
    images = List.castFrom<dynamic, String>(json['images']);
    organs = List.castFrom<dynamic, String>(json['organs']);
    includeRelatedImages = json['includeRelatedImages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['project'] = project;
    _data['images'] = images;
    _data['organs'] = organs;
    _data['includeRelatedImages'] = includeRelatedImages;
    return _data;
  }
}

class Results {
  Results({
    required this.score,
    required this.species,
    required this.gbif,
  });
  late final double score;
  late final Species species;
  late final Gbif gbif;

  Results.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    species = Species.fromJson(json['species']);
    gbif = Gbif.fromJson(json['gbif']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['score'] = score;
    _data['species'] = species.toJson();
    _data['gbif'] = gbif.toJson();
    return _data;
  }
}

class Species {
  Species({
    required this.scientificNameWithoutAuthor,
    required this.scientificNameAuthorship,
    required this.genus,
    required this.family,
    required this.commonNames,
    required this.scientificName,
  });
  late final String scientificNameWithoutAuthor;
  late final String scientificNameAuthorship;
  late final Genus genus;
  late final Family family;
  late final List<String> commonNames;
  late final String scientificName;

  Species.fromJson(Map<String, dynamic> json) {
    scientificNameWithoutAuthor = json['scientificNameWithoutAuthor'];
    scientificNameAuthorship = json['scientificNameAuthorship'];
    genus = Genus.fromJson(json['genus']);
    family = Family.fromJson(json['family']);
    commonNames = List.castFrom<dynamic, String>(json['commonNames']);
    scientificName = json['scientificName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['scientificNameWithoutAuthor'] = scientificNameWithoutAuthor;
    _data['scientificNameAuthorship'] = scientificNameAuthorship;
    _data['genus'] = genus.toJson();
    _data['family'] = family.toJson();
    _data['commonNames'] = commonNames;
    _data['scientificName'] = scientificName;
    return _data;
  }
}

class Genus {
  Genus({
    required this.scientificNameWithoutAuthor,
    required this.scientificNameAuthorship,
    required this.scientificName,
  });
  late final String scientificNameWithoutAuthor;
  late final String scientificNameAuthorship;
  late final String scientificName;

  Genus.fromJson(Map<String, dynamic> json) {
    scientificNameWithoutAuthor = json['scientificNameWithoutAuthor'];
    scientificNameAuthorship = json['scientificNameAuthorship'];
    scientificName = json['scientificName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['scientificNameWithoutAuthor'] = scientificNameWithoutAuthor;
    _data['scientificNameAuthorship'] = scientificNameAuthorship;
    _data['scientificName'] = scientificName;
    return _data;
  }
}

class Family {
  Family({
    required this.scientificNameWithoutAuthor,
    required this.scientificNameAuthorship,
    required this.scientificName,
  });
  late final String scientificNameWithoutAuthor;
  late final String scientificNameAuthorship;
  late final String scientificName;

  Family.fromJson(Map<String, dynamic> json) {
    scientificNameWithoutAuthor = json['scientificNameWithoutAuthor'];
    scientificNameAuthorship = json['scientificNameAuthorship'];
    scientificName = json['scientificName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['scientificNameWithoutAuthor'] = scientificNameWithoutAuthor;
    _data['scientificNameAuthorship'] = scientificNameAuthorship;
    _data['scientificName'] = scientificName;
    return _data;
  }
}

class Gbif {
  Gbif({
    required this.id,
  });
  late final String id;

  Gbif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}
