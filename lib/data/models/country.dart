class Country {
  final String name;
  final String newCases;
  final String newDeaths;
  final String totalCases;
  final String totalDeaths;
  final String totalRecovered;

  Country({
    this.name,
    this.newCases,
    this.newDeaths,
    this.totalCases,
    this.totalDeaths,
    this.totalRecovered,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['country'],
      newCases: json['new_cases'],
      newDeaths: json['new_deaths'],
      totalCases: json['total_cases'],
      totalDeaths: json['total_deaths'],
      totalRecovered: json['total_recovered'],
    );
  }

  @override
  String toString() => '''{
    name: $name,
    newCases: $newCases,
    newDeaths: $newDeaths,
    totalCases: $totalCases,
    totalDeaths: $totalDeaths,
    totalRecovered: $totalRecovered,
  }
  ''';
}
