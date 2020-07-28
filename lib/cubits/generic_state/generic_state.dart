import 'package:equatable/equatable.dart';

abstract class GenericState extends Equatable {
  const GenericState();

  @override
  List<Object> get props => [];
}

class Initial extends GenericState {}

class InProgress extends GenericState {}

class Failure extends GenericState {
  Failure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class Success<T> extends GenericState {
  Success(this.data) : assert(data != null);

  final T data;

  @override
  List<Object> get props => [data];
}
