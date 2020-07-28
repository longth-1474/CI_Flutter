import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

class InitState extends BaseState {}

class LoadingState extends BaseState {}

class LoadedState<T> extends BaseState {
  final T data;

  LoadedState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}

class ErrorState<T> extends BaseState {
  final T data;

  ErrorState({@required this.data}) : assert(data != null);

  @override
  List<Object> get props => [data];
}
