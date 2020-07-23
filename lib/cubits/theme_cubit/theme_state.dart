part of './theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  ThemeState(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}
