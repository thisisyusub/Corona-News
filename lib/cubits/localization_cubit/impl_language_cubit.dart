/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusubov@yandex.com>, July 2020
 */

import 'package:flutter/material.dart';

abstract class ILanguageCubit {
  Future<Locale> loadDefaultLocale();

  Future<void> changeLocale(String selectedLanguageCode);
}
