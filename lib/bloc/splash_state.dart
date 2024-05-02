part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadedState extends SplashState {
  SplashLoadedState();
}

class SplashErrorState extends SplashState {
  final String error;

  SplashErrorState({required this.error});
}
