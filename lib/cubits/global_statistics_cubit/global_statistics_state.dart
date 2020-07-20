/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

part of './global_statistics_cubit.dart';

abstract class GlobalStatisticsState extends Equatable {
  const GlobalStatisticsState();

  @override
  List<Object> get props => [];
}

class GlobalStatisticsInitial extends GlobalStatisticsState {}

class GlobalStatisticsInProgress extends GlobalStatisticsState {}

class GlobalStatisticsFailure extends GlobalStatisticsState {
  GlobalStatisticsFailure(this.message) : assert(message != null);

  final String message;

  @override
  List<Object> get props => [message];
}

class GlobalStatisticsSuccess extends GlobalStatisticsState {
  GlobalStatisticsSuccess(this.statistics) : assert(statistics != null);

  final Stat statistics;

  @override
  List<Object> get props => [statistics];
}
