/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

part of 'localization_cubit.dart';

class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState(this.locale) : assert(locale != null);

  @override
  List<Object> get props => [locale];
}
