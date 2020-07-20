/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

class Stat {
  final String activeCases;
  final String criticalCases;
  final String newCases;
  final String newDeaths;
  final String perMillion;
  final String totalCases;
  final String totalDeaths;
  final String totalRecovered;

  Stat({
    this.activeCases,
    this.criticalCases,
    this.newCases,
    this.newDeaths,
    this.perMillion,
    this.totalCases,
    this.totalDeaths,
    this.totalRecovered,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      activeCases: json['active_cases'],
      criticalCases: json['critical_cases'],
      newCases: json['new_cases'],
      newDeaths: json['new_deaths'],
      perMillion: json['per_mln'],
      totalCases: json['total_cases'],
      totalDeaths: json['total_deaths'],
      totalRecovered: json['total_recovered'],
    );
  }
}
