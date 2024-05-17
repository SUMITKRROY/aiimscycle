part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadedState extends SplashState {
  final String? checkRole;

  SplashLoadedState({this.checkRole});
}

class SplashErrorState extends SplashState {
  final String error;

  SplashErrorState({required this.error});
}
