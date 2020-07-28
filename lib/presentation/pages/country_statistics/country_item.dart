import 'package:flutter/material.dart';

import '../../../data/models/country.dart';

class CountryItem extends StatelessWidget {
  CountryItem(this.country) : assert(country != null);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListTile(
          title: Text(country.name),
          subtitle: Text(country.newCases),
          trailing: Text(country.totalCases),
        ),
      ),
    );
  }
}
